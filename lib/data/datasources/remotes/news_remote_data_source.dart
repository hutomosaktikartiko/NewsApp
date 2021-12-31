import 'package:dio/dio.dart';
import 'package:news_app/data/models/news_model.dart';

abstract class NewsRemoteDataSource {
  Future<List<NewsModel>> listNewsTopHeadlines();
  Future<List<NewsModel>> listNewsTopHeadlinesByCategory({
    required String category,
  });
  Future<List<NewsModel>> listNewsTopHeadlinesSearch({
    required String keyword,
  });
}

class NewsRemoteDataSourceImpl implements NewsRemoteDataSource {
  final Dio dio;

  NewsRemoteDataSourceImpl({required this.dio});

  @override
  Future<List<NewsModel>> listNewsTopHeadlines() async {
    return await _news(urlData: 'top-headlines?country=id');
  }

  @override
  Future<List<NewsModel>> listNewsTopHeadlinesByCategory({
    required String category,
  }) async {
    return await _news(urlData: 'top-headlines?country=id&category=$category');
  }

  @override
  Future<List<NewsModel>> listNewsTopHeadlinesSearch({
    required String keyword,
  }) async {
    return await _news(urlData: 'top-headlines?country=id&q=$keyword');
  }

  Future<List<NewsModel>> _news({required String urlData}) async {
    try {
      var response = await dio.get(urlData);

      List results = response.data['articles'];

      return results.map((e) => NewsModel.fromJson(e)).toList();
    } on DioError catch (e) {
      throw e;
    }
  }
}
