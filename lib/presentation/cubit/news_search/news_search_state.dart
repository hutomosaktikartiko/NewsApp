part of 'news_search_cubit.dart';

abstract class NewsSearchState extends Equatable {
  const NewsSearchState();

  @override
  List<Object?> get props => [];
}

class NewsSearchInitial extends NewsSearchState {}

class NewsSearchLoaded extends NewsSearchState {
  final List<NewsModel> listNews;

  NewsSearchLoaded({required this.listNews});

  @override
  List<Object?> get props => [listNews];
}

class NewsSearchLoadingFailure extends NewsSearchState {
  final String message;

  NewsSearchLoadingFailure({required this.message});

  @override
  List<Object?> get props => [message];
}