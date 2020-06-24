part of 'page_bloc.dart';

abstract class PageEvent extends Equatable {
  const PageEvent();
}

class GoToSplashPage extends PageEvent {
  @override
  List<Object> get props => [];
}

class GoToMainPage extends PageEvent {
  @override
  List<Object> get props => [];
}

class GoToNewsDetailPage extends PageEvent {
  final News news;

  GoToNewsDetailPage(this.news);

  @override
  List<Object> get props => throw UnimplementedError();
}

class GoToNewsByCategory extends PageEvent {
  final String selectedCategory;

  GoToNewsByCategory(this.selectedCategory);

  @override
  List<Object> get props => [selectedCategory];
}
