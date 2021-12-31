import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../data/models/api_return_value.dart';
import '../../../data/models/category_model.dart';
import '../../../data/models/news_model.dart';
import '../../../data/repositories/news_repository.dart';

part 'news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsCubit({
    required this.newsRepository,
  }) : super(NewsInitial());

  final NewsRepository newsRepository;

  Future<ApiReturnValue<bool>> getListNewsTopHeadlinesByCategory({
    required CategoryModel category,
  }) async {
    emit(NewsInitial());
    ApiReturnValue<List<NewsModel>> result = await newsRepository
        .listNewsTopHeadlinesByCategory(category: category.category ?? "");

    if (result.isSuccess) {
      emit(NewsLoaded(listNews: result.value ?? []));
    } else {
      emit(NewsLoadingFailure(message: result.message ?? ''));
    }

    return ApiReturnValue(
      isSuccess: result.isSuccess,
      message: result.message,
    );
  }
}
