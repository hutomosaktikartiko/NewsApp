part of 'pages.dart';

class NewsBySearch extends StatefulWidget {
  @override
  _NewsBySearchState createState() => _NewsBySearchState();
}

class _NewsBySearchState extends State<NewsBySearch> {
  @override
  void initState() {
    super.initState();
  }

  TextEditingController searchKeywordController = TextEditingController();
  List<News> news;
  String searchKeyword = "covid";

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          context.bloc<PageBloc>().add(GoToMainPage());

          return;
        },
        child: Scaffold(
          body: SafeArea(
            child: Container(
              color: Colors.white,
              child: ListView(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.symmetric(
                        vertical: 10, horizontal: defaultMargin),
                    height: 56,
                    child: Stack(
                      children: <Widget>[
                        Align(
                          alignment: Alignment.centerLeft,
                          child: GestureDetector(
                            onTap: () {
                              context.bloc<PageBloc>().add(GoToMainPage());
                            },
                            child: Icon(
                              Icons.arrow_back,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Center(
                          child: Text(
                            "Cari Berita",
                            style: blackTextFont.copyWith(fontSize: 20),
                            textAlign: TextAlign.center,
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: defaultMargin, right: defaultMargin),
                    child: TextField(
                      controller: searchKeywordController,
                      onChanged: (value) {
                        searchKeyword = value;
                        setState(() {});
                      },
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          labelText: "Cari berita $searchKeyword",
                          hintText: "Cari berita..."),
                    ),
                  ),
                  Container(
                      margin: EdgeInsets.symmetric(
                          horizontal: defaultMargin, vertical: 10),
                      child: Text(
                        "Hasil pencarian $searchKeyword...",
                        style: blackTextFont.copyWith(fontSize: 18),
                      )),
                  FutureBuilder(
                      future: NewsServices.getNewsBySearch(searchKeyword),
                      builder: (_, snapshot) {
                        if (snapshot.hasData) {
                          news = snapshot.data;
                          return (news.length < 1)
                              ? Center(
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 30.0),
                                    child: Text(
                                      "Tidak ada berita",
                                      style: blackTextFont.copyWith(
                                          fontSize: 15, color: Colors.red),
                                    ),
                                  ),
                                )
                              : ListView.builder(
                                  shrinkWrap: true,
                                  physics: ClampingScrollPhysics(),
                                  itemCount: news.length,
                                  itemBuilder: (_, index) => Container(
                                        margin: EdgeInsets.only(
                                          left: defaultMargin,
                                          right: defaultMargin,
                                        ),
                                        child: NewsCard(news[index], onTap: () {
                                          context.bloc<PageBloc>().add(
                                              GoToNewsDetailPage(news[index]));
                                        }),
                                      ));
                        } else {
                          return SpinKitFadingCircle(
                            color: mainColor,
                            size: 50,
                          );
                        }
                      })
                ],
              ),
            ),
          ),
        ));
  }
}
