part of 'page_bloc.dart';

abstract class PageState extends Equatable {
  const PageState();
}

class OnInitialPage extends PageState {
  @override
  List<Object> get props => [];
}

class OnSplashPage extends PageState {
  @override
  List<Object> get props => [];
}

class OnMainPage extends PageState {
  @override
  List<Object> get props => [];
}

class OnNewsDetailPage extends PageState {
  final News news;

  OnNewsDetailPage(this.news);

  @override
  List<Object> get props => throw UnimplementedError();
}

class OnNewsByCategoryPage extends PageState {
  final String selectedCategory;

  OnNewsByCategoryPage(this.selectedCategory);

  @override
  List<Object> get props => [selectedCategory];
}

class OnNewsBySearchPage extends PageState {
  @override
  List<Object> get props => [];
}

class OnNewsSavePage extends PageState {
  @override
  List<Object> get props => [];
}
