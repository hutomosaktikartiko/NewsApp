import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:news_app/data/models/api_return_value.dart';
import 'package:news_app/data/models/news_model.dart';
import 'package:news_app/data/repositories/news_repository.dart';

part 'news_favorite_state.dart';

typedef ApiReturnValue<List<NewsModel>> _NewsRepository();

class NewsFavoriteCubit extends Cubit<NewsFavoriteState> {
  NewsFavoriteCubit({
    required this.newsRepository,
  }) : super(NewsFavoriteState(listNews: []));

  final NewsRepository newsRepository;

  ApiReturnValue<bool> saveNews({
    required NewsModel news,
  }) {
    return _news(
      newsRepository: () => newsRepository.saveNews(
        news: news,
      ),
    );
  }

  ApiReturnValue<bool> deleteNews({
    required NewsModel news,
  }) {
    return _news(
      newsRepository: () => newsRepository.deleteSavedNews(
        news: news,
      ),
    );
  }

  ApiReturnValue<bool> getAllSavedNews({
    required NewsModel news,
  }) {
    return _news(
      newsRepository: () => newsRepository.getAllSavedNews(),
    );
  }

  ApiReturnValue<bool> _news({
    required _NewsRepository newsRepository,
  }) {
    ApiReturnValue<List<NewsModel>> result = newsRepository();

    if (result.isSuccess) {
      emit(NewsFavoriteState(listNews: result.value!));
    } else {
      emit(NewsFavoriteState(listNews: []));
    }

    return ApiReturnValue(
      isSuccess: result.isSuccess,
      message: result.message,
    );
  }
}
