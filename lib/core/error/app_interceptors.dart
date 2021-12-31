import 'dart:developer';

import 'package:dio/dio.dart';

class AppInterceptors extends Interceptor {
  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) {
    log(
      'REQUEST[${options.method}] => PATH: ${options.path}',
    );
    return super.onRequest(
      options,
      handler,
    );
  }

  @override
  void onResponse(
    Response response,
    ResponseInterceptorHandler handler,
  ) {
    log(
      'RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}',
    );
    return super.onResponse(
      response,
      handler,
    );
  }

  @override
  void onError(
    DioError err,
    ErrorInterceptorHandler handler,
  ) {
    log(
      'ERROR[${err.response?.statusCode}] || TYPE[${err.type}] => PATH: ${err.requestOptions.path}',
    );
    log("${err.response?.data}");

    switch (err.type) {
      case DioErrorType.connectTimeout:
      case DioErrorType.sendTimeout:
      case DioErrorType.receiveTimeout:
        throw DeadlineExceededException(err.requestOptions);
      case DioErrorType.response:
        switch (err.response?.statusCode) {
          case 400:
            throw BadRequestException(err: err);
          case 401:
            throw UnauthorizedException(err.requestOptions);
          case 404:
            throw NotFoundException(err.requestOptions);
          case 409:
            throw ConflictException(err.requestOptions);
          case 500:
            throw InternalServerErrorException(err.requestOptions);
        }
        break;
      case DioErrorType.cancel:
        break;
      case DioErrorType.other:
        throw NoInternetConnectionException(err.requestOptions);
    }

    return handler.next(err);
  }
}

class BadRequestException extends DioError {
  final DioError err;

  BadRequestException({
    required this.err,
  }) : super(requestOptions: err.requestOptions);

  @override
  String toString() {
    if (err.response?.data['message'] is Iterable) {
      if ((err.response?.data['message'] as Iterable).length > 0) {
        if ((err.response?.data['message'] as Iterable).first is Map) {
          return ((err.response?.data['message'] as Iterable).first
                  as Map<String, String>)
              .values
              .first;
        }
      }
    } else if (err.response?.data['message'] is Map<String, dynamic>) {
      if (err.response?.data['message']['errors'] != null) {
        print("MAP => ERRORS");
        if (err.response?.data['message']['errors'] is Map) {
          if ((err.response?.data['message']['errors'] as Map).values.first
              is Iterable) {
            return ((err.response?.data['message']['errors'] as Map)
                    .values
                    .first as Iterable)
                .first;
          }
        }
      } else {
        if (err.response?.data['message'] is Map) {
          if ((err.response?.data['message'] as Map).values.first
              is Iterable) {
            return ((err.response?.data['message'] as Map)
                    .values
                    .first as Iterable)
                .first;
          }
        }
      }
    } else if (err.response?.data['message'] is String) {
      return err.response?.data['message'];
    }

    return "Data yang anda isikan tidak sesuai";
  }
}

class InternalServerErrorException extends DioError {
  InternalServerErrorException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return 'Unknown error occurred, please try again later.';
  }
}

class ConflictException extends DioError {
  ConflictException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return 'Conflict occurred';
  }
}

class UnauthorizedException extends DioError {
  UnauthorizedException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return 'Access denied';
  }
}

class NotFoundException extends DioError {
  NotFoundException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return 'The requested information could not be found';
  }
}

class NoInternetConnectionException extends DioError {
  NoInternetConnectionException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return 'No internet connection detected, please try again.';
  }
}

class DeadlineExceededException extends DioError {
  DeadlineExceededException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return 'The connection has timed out, please try again.';
  }
}
