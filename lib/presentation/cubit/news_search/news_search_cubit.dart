import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:news_app/data/models/news_model.dart';
import 'package:news_app/data/models/api_return_value.dart';
import 'package:news_app/data/repositories/news_repository.dart';

part 'news_search_state.dart';

typedef Future<ApiReturnValue<List<NewsModel>>> _NewsRepositoryChooser();

class NewsSearchCubit extends Cubit<NewsSearchState> {
  NewsSearchCubit({
    required this.newsRepository,
  }) : super(NewsSearchInitial());

  final NewsRepository newsRepository;

  Future<ApiReturnValue<bool>> listNewsTopHeadlines() async {
    return await _news(
      newsRepositoryChooser: () => newsRepository.listNewsTopHeadlines(),
    );
  }

  Future<ApiReturnValue<bool>> listNewsTopHeadlinesSearch({
    required String keyword,
  }) async {
    return await _news(
      newsRepositoryChooser: () => newsRepository.listNewsTopHeadlinesSearch(
        keyword: keyword,
      ),
    );
  }

  Future<ApiReturnValue<bool>> _news({
    required _NewsRepositoryChooser newsRepositoryChooser,
  }) async {
    emit(NewsSearchInitial());
    ApiReturnValue<List<NewsModel>> result = await newsRepositoryChooser();

    if (result.isSuccess) {
      emit(NewsSearchLoaded(listNews: result.value ?? []));
    } else {
      emit(NewsSearchLoadingFailure(message: result.message ?? ''));
    }

    return ApiReturnValue(
      isSuccess: result.isSuccess,
      message: result.message,
    );
  }
}
