import 'package:news_app/data/models/api_return_value.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/news_model.dart';

abstract class NewsLocalDataSource {
  ApiReturnValue<List<NewsModel>> getAllSavedNews();
  ApiReturnValue<List<NewsModel>> saveNews({
    required NewsModel news,
  });
  ApiReturnValue<List<NewsModel>> deleteSavedNews({
    required NewsModel news,
  });
}

class NewsLocalDataSourceImpl implements NewsLocalDataSource {
  final SharedPreferences sharedPreferences;

  NewsLocalDataSourceImpl({
    required this.sharedPreferences,
  });

  @override
  ApiReturnValue<List<NewsModel>> deleteSavedNews({
    required NewsModel news,
  }) {
    try {
      sharedPreferences.remove(news.title ?? '');

      return ApiReturnValue(
        message: "Berhasil menghapus berita",
        value: _getNews(),
      );
    } catch (e) {
      throw e;
    }
  }



  @override
  ApiReturnValue<List<NewsModel>> saveNews({required NewsModel news}) {
    try {
      sharedPreferences.setStringList(news.title ?? '', [
        news.author ?? '',
        news.title ?? '',
        news.description ?? '',
        news.url ?? '',
        news.urlToImage ?? '',
        news.content ?? ''
      ]);

      return ApiReturnValue(
        message: "Berhasil menyimpan berita",
        value: _getNews(),
      );
    } catch (e) {
      throw e;
    }
  }

  @override
  ApiReturnValue<List<NewsModel>> getAllSavedNews() {
    return ApiReturnValue(
      value: _getNews(),
    );
  }

  List<NewsModel> _getNews() {
    try {
      var save = sharedPreferences.getKeys();
      List<String> keys = [];
      List<NewsModel> listNews = [];

      save.forEach((element) {
        keys.add(element);
      });

      keys.forEach(
        (element) {
          List<String> content = sharedPreferences.getStringList(element) ?? [];
          NewsModel news = NewsModel(
              author: content[0],
              title: content[1],
              description: content[2],
              url: content[3],
              urlToImage: content[4],
              content: content[5]);
          listNews.add(news);
        },
      );

      return listNews;
    } catch (e) {
      throw e;
    }
  }
}
