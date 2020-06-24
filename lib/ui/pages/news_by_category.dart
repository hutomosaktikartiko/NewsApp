part of 'pages.dart';

class NewsByCategory extends StatelessWidget {
  final String category;

  NewsByCategory(this.category);

  // getCategoryNews() async {
  //   CategoryModel newsClass = CategoryModel();
  //   await newsClass.getCategoryNews(widget.category);
  //   articles = newsClass.news;
  //   setState(() {
  //     _loading = false;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    List<News> news;
    return WillPopScope(
      onWillPop: () async {
        context.bloc<PageBloc>().add(GoToMainPage());

        return;
      },
      child: Scaffold(
        body: ListView(
          children: <Widget>[
            Container(
              margin: EdgeInsets.fromLTRB(defaultMargin, 20, defaultMargin, 10),
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
    );
//     return Scaffold(
//       appBar: AppBar(
//         title: Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Text("News"),
//             Text(
//               "App",
//               style: TextStyle(color: Colors.blue),
//             )
//           ],
//         ),
//         actions: <Widget>[
//           Opacity(
//             opacity: 0,
//             child: Container(
//               padding: EdgeInsets.symmetric(
//                 horizontal: 16,
//               ),
//               child: Icon(Icons.save),
//             ),
//           )
//         ],
//         centerTitle: true,
//         elevation: 0.0,
//       ),
//       body: _loading
//           ? Center(
//               child: Container(child: CircularProgressIndicator()),
//             )
//           : SingleChildScrollView(
//               child: Container(
//                   padding: EdgeInsets.symmetric(horizontal: 16),
//                   child: Column(
//                     children: <Widget>[
//                       //blogs
//                       Container(
//                         padding: EdgeInsets.only(top: 16),
//                         child: ListView.builder(
//                             itemCount: articles.length,
//                             shrinkWrap: true,
//                             //scroll
//                             physics: ClampingScrollPhysics(),
//                             itemBuilder: (context, index) {
//                               return BlogTile(
//                                 imageUrl: articles[index].urlToImage,
//                                 title: articles[index].title,
//                                 desc: articles[index].description,
//                                 url: articles[index].url,
//                               );
//                             }),
//                       )
//                     ],
//                   )),
//             ),
//     );
//   }
// }

// class BlogTile extends StatelessWidget {
//   final String imageUrl, title, desc, url;
//   BlogTile(
//       {@required this.imageUrl,
//       @required this.title,
//       @required this.desc,
//       @required this.url});

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         Navigator.push(
//             context,
//             MaterialPageRoute(
//                 builder: (context) => NewsDetail(
//                       blogUrl: url,
//                     )));
//       },
//       child: Container(
//         margin: EdgeInsets.only(bottom: 16),
//         child: Column(
//           children: <Widget>[
//             ClipRRect(
//                 borderRadius: BorderRadius.circular(6),
//                 child: Image.network(imageUrl)),
//             SizedBox(height: 8),
//             Text(
//               title,
//               style: TextStyle(
//                   fontSize: 18,
//                   fontWeight: FontWeight.w500,
//                   color: Colors.black87),
//             ),
//             SizedBox(height: 8),
//             Text(
//               desc,
//               style: TextStyle(color: Colors.black54),
//             )
//           ],
//         ),
//       ),
//     );
  }
}
