import 'package:news_app/core/config/labels_config.dart';
import 'package:news_app/core/network/network_info.dart';
import 'package:news_app/data/datasources/locals/news_local_data_source.dart';
import 'package:news_app/data/datasources/remotes/news_remote_data_source.dart';
import 'package:news_app/data/models/api_return_value.dart';
import 'package:news_app/data/models/news_model.dart';

typedef Future<List<NewsModel>> _NewsRemoteDataSourceChooser();
typedef ApiReturnValue<List<NewsModel>> _NewsLocalDataSourceChooser();

abstract class NewsRepository {
  Future<ApiReturnValue<List<NewsModel>>> listNewsTopHeadlines();
  Future<ApiReturnValue<List<NewsModel>>> listNewsTopHeadlinesByCategory({
    required String category,
  });
  Future<ApiReturnValue<List<NewsModel>>> listNewsTopHeadlinesSearch({
    required String keyword,
  });
  ApiReturnValue<List<NewsModel>> saveNews({
    required NewsModel news,
  });
  ApiReturnValue<List<NewsModel>> getAllSavedNews();
  ApiReturnValue<List<NewsModel>> deleteSavedNews({
    required NewsModel news,
  });
}

class NewsRepositoryImpl implements NewsRepository {
  final NetworkInfo networkInfo;
  final NewsRemoteDataSource newsRemoteDataSource;
  final NewsLocalDataSource newsLocalDataSource;

  NewsRepositoryImpl({
    required this.networkInfo,
    required this.newsRemoteDataSource,
    required this.newsLocalDataSource,
  });

  @override
  Future<ApiReturnValue<List<NewsModel>>> listNewsTopHeadlines() async {
    return _newsRemote(
      newsRemoteDataSourceChooser: () =>
          newsRemoteDataSource.listNewsTopHeadlines(),
    );
  }

  @override
  Future<ApiReturnValue<List<NewsModel>>> listNewsTopHeadlinesByCategory({
    required String category,
  }) async {
    return await _newsRemote(
      newsRemoteDataSourceChooser: () =>
          newsRemoteDataSource.listNewsTopHeadlinesByCategory(
        category: category,
      ),
    );
  }

  @override
  Future<ApiReturnValue<List<NewsModel>>> listNewsTopHeadlinesSearch({
    required String keyword,
  }) async {
    return await _newsRemote(
      newsRemoteDataSourceChooser: () =>
          newsRemoteDataSource.listNewsTopHeadlinesSearch(
        keyword: keyword,
      ),
    );
  }

  @override
  ApiReturnValue<List<NewsModel>> deleteSavedNews({
    required NewsModel news,
  }) {
    return _newsLocal(
      newsLocalDataSourceChooser: () => newsLocalDataSource.deleteSavedNews(
        news: news,
      ),
    );
  }

  @override
  ApiReturnValue<List<NewsModel>> getAllSavedNews() {
    return _newsLocal(
      newsLocalDataSourceChooser: () => newsLocalDataSource.getAllSavedNews(),
    );
  }

  @override
  ApiReturnValue<List<NewsModel>> saveNews({
    required NewsModel news,
  }) {
    return _newsLocal(
      newsLocalDataSourceChooser: () => newsLocalDataSource.saveNews(
        news: news,
      ),
    );
  }

  Future<ApiReturnValue<List<NewsModel>>> _newsRemote({
    required _NewsRemoteDataSourceChooser newsRemoteDataSourceChooser,
  }) async {
    if (await networkInfo.isConnected) {
      try {
        final List<NewsModel> listNews = await newsRemoteDataSourceChooser();

        return ApiReturnValue(
          isSuccess: true,
          value: listNews,
        );
      } catch (e) {
        return ApiReturnValue(
          isSuccess: false,
          message: e.toString(),
        );
      }
    } else {
      return ApiReturnValue(
        isSuccess: false,
        message: LabelsConfig.noInternet,
      );
    }
  }

  ApiReturnValue<List<NewsModel>> _newsLocal({
    required _NewsLocalDataSourceChooser newsLocalDataSourceChooser,
  }) {
    try {
      final ApiReturnValue<List<NewsModel>> result = newsLocalDataSourceChooser();

      return ApiReturnValue(
        isSuccess: true,
        value: result.value,
        message: result.message,
      );
    } catch (e) {
      return ApiReturnValue(
        isSuccess: false,
        message: e.toString(),
      );
    }
  }
}
