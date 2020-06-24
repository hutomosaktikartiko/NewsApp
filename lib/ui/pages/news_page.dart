part of 'pages.dart';

class NewsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Container(
          margin: EdgeInsets.fromLTRB(defaultMargin, 20, defaultMargin, 10),
          child: Text("Kategori",
              style: blackTextFont.copyWith(
                  fontSize: 20, fontWeight: FontWeight.bold)),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: listCategories
                .map((e) => Padding(
                    padding: EdgeInsets.only(
                      left: defaultMargin,
                    ),
                    child: GestureDetector(
                        onTap: () {
                          context
                              .bloc<PageBloc>()
                              .add(GoToNewsByCategory(e.categoryName));
                        },
                        child: CategoryCard(e))))
                .toList(),
          ),
        ),
        Container(
          margin: EdgeInsets.fromLTRB(defaultMargin, 20, defaultMargin, 10),
          child: Text("Berita Terbaru",
              style: blackTextFont.copyWith(
                  fontSize: 20, fontWeight: FontWeight.bold)),
        ),
        BlocBuilder<NewsBloc, NewsState>(builder: (_, newsState) {
          if (newsState is NewsLoaded) {
            List<News> news = newsState.news;
            return ListView.builder(
                shrinkWrap: true,
                physics: ClampingScrollPhysics(),
                itemCount: news.length,
                itemBuilder: (_, index) => Container(
                      margin: EdgeInsets.only(
                        left: defaultMargin,
                        right: defaultMargin,
                      ),
                      child: NewsCard(news[index], onTap: () {
                        context
                            .bloc<PageBloc>()
                            .add(GoToNewsDetailPage(news[index]));
                      }),
                    ));
          } else {
            return SpinKitFadingCircle(
              color: mainColor,
              size: 50,
            );
          }
        }),
        SizedBox(
          height: 100,
        )
      ],
    );
  }
}
