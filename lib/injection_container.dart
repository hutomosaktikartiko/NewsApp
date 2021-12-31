import 'dart:async';

import 'package:dio/dio.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/config/urls_config.dart';
import 'core/error/app_interceptors.dart';
import 'core/network/network_info.dart';
import 'core/oberservers/firebase_analytics_observer_info.dart';
import 'data/datasources/locals/news_local_data_source.dart';
import 'data/datasources/remotes/news_remote_data_source.dart';
import 'data/repositories/news_repository.dart';
import 'presentation/cubit/cubits.dart';
import 'presentation/cubit/internet_connection/internet_connection_cubit.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Cubit
  sl.registerFactory(
    () => InternetConnectionCubit(internetConnectionChecker: sl()),
  );
  sl.registerFactory(
    () => NewsSearchCubit(newsRepository: sl()),
  );

  sl.registerFactory(
    () => NewsFavoriteCubit(newsRepository: sl()),
  );
  sl.registerFactory(() => TabCategoryCubit());
  sl.registerFactory(
    () => NewsCubit(
      newsRepository: sl(),
    ),
  );

  // Repositories
  sl.registerLazySingleton<NewsRepository>(
    () => NewsRepositoryImpl(
      networkInfo: sl(),
      newsRemoteDataSource: sl(),
      newsLocalDataSource: sl(),
    ),
  );

  // Datasources
  sl.registerLazySingleton<NewsLocalDataSource>(
    () => NewsLocalDataSourceImpl(sharedPreferences: sl()),
  );
  sl.registerLazySingleton<NewsRemoteDataSource>(
    () => NewsRemoteDataSourceImpl(dio: sl()),
  );

  // Core
  sl.registerLazySingleton<NetworkInfo>(
    () => NetworkInfoImpl(internetConnectionChecker: sl()),
  );
  sl.registerLazySingleton<FirebaseAnalyticsObserverInfo>(
    () => FirebaseAnalyticsObserverInfoImpl(
      analytics: sl(),
    ),
  );

  // External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton<FirebaseAnalytics>(() => FirebaseAnalytics.instance);
  sl.registerLazySingleton(
    () => Dio(
      BaseOptions(
        baseUrl: UrlsConfig.newsApiKey,
        connectTimeout: 5000,
        receiveTimeout: 3000,
        headers: {
          "x-api-key": "a881f2e836b247bf82c0d43bb06901ab",
        },
      ),
    )..interceptors.add(AppInterceptors()),
  );
  sl.registerLazySingleton(() => InternetConnectionChecker());
}
