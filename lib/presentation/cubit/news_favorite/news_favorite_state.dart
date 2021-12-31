part of 'news_favorite_cubit.dart';

class NewsFavoriteState extends Equatable {
  final List<NewsModel> listNews;

  NewsFavoriteState({
    required this.listNews,
  });

  @override
  List<Object?> get props => [listNews];
}
