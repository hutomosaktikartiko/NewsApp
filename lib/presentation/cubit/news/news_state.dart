part of 'news_cubit.dart';

abstract class NewsState extends Equatable {
  const NewsState();

  @override
  List<Object?> get props => [];
}

class NewsInitial extends NewsState {}

class NewsLoaded extends NewsState {
  final List<NewsModel> listNews;

  NewsLoaded({required this.listNews});

  @override
  List<Object?> get props => [listNews];
}

class NewsLoadingFailure extends NewsState {
  final String message;

  NewsLoadingFailure({required this.message});

  @override
  List<Object?> get props => [message];
}