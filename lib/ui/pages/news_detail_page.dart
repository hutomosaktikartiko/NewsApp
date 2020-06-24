part of 'pages.dart';

class NewsDetail extends StatelessWidget {
  final News news;
  NewsDetail(this.news);

  final Completer<WebViewController> _completer =
      Completer<WebViewController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: WillPopScope(
        onWillPop: () async {
          context.bloc<PageBloc>().add(GoToMainPage());

          return;
        },
        child: Scaffold(
          body: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Stack(
              children: <Widget>[
                WebView(
                  initialUrl: news.url,
                  onWebViewCreated: (WebViewController webViewController) {
                    _completer.complete(webViewController);
                  },
                ),
                //icon back
                Container(
                  margin: EdgeInsets.only(top: 20, left: defaultMargin),
                  padding: EdgeInsets.all(1),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.black.withOpacity(0.5)),
                  child: GestureDetector(
                    onTap: () {
                      context.bloc<PageBloc>().add(GoToMainPage());
                    },
                    child: Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                )
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
              backgroundColor: Colors.blue,
              child: Icon(MdiIcons.briefcasePlusOutline),
              onPressed: () {}),
        ),
      ),
    );
  }

  // Widget saveButton() {
  //   return Icon(
  //     Icons.save,
  //     color: Colors.blue,
  //   );
  // }
}
