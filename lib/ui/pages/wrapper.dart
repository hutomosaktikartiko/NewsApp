part of 'pages.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PageBloc, PageState>(
      builder: (_, pageState) => (pageState is OnMainPage)
          ? MainPage()
          : (pageState is OnNewsDetailPage)
              ? NewsDetail(pageState.news)
              : (pageState is OnNewsByCategoryPage)
                  ? NewsByCategory(pageState.selectedCategory)
                  : SplashPage(),
    );
  }
}
