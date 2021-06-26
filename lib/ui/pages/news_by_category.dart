part of 'pages.dart';

class NewsByCategory extends StatelessWidget {
  final String category;

  NewsByCategory(this.category);

  @override
  Widget build(BuildContext context) {
    List<News> news;
    return WillPopScope(
      onWillPop: () async {
        context.bloc<PageBloc>().add(GoToMainPage());

        return;
      },
      child: Scaffold(
        body: SafeArea(
          child: ListView(
            children: <Widget>[
              Container(
                margin:
                    EdgeInsets.fromLTRB(defaultMargin, 20, defaultMargin, 10),
                child: Row(
                  children: <Widget>[
                    Container(
                      height: 20,
                      margin: EdgeInsets.only(bottom: 4),
                      child: GestureDetector(
                        child: Icon(Icons.arrow_back),
                        onTap: () {
                          context.bloc<PageBloc>().add(GoToMainPage());
                        },
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text("Kategori $category",
                        style: blackTextFont.copyWith(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
              FutureBuilder(
                  future: NewsServices.getNewsByCategory(category),
                  builder: (_, snapshot) {
                    if (snapshot.hasData) {
                      news = snapshot.data;
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
          ),
        ),
      ),
    );
  }
}
