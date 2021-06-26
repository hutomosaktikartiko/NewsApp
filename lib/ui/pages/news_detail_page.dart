part of 'pages.dart';

class NewsDetail extends StatefulWidget {
  final News news;
  NewsDetail(this.news);

  @override
  _NewsDetailState createState() => _NewsDetailState();
}

class _NewsDetailState extends State<NewsDetail> {
  List<News> listNewsSave = [];
  final Completer<WebViewController> _completer =
      Completer<WebViewController>();

  Future<List<News>> listSaveNews;
  bool isSaved = false;

  @override
  void initState() {
    listSaveNews = NewsSave.getAllSaveNews();

    if (mounted) {
      listSaveNews.then((value) => value.forEach((element) {
            if (element.url == widget.news.url) {
              setState(() {
                isSaved = true;
              });
            }
          }));
    }

    super.initState();
  }

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
                  initialUrl: widget.news.url,
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
          floatingActionButton:
              (isSaved) ? buildButtonSaved(context) : buildButtonSave(context),
        ),
      ),
    );
  }

  FloatingActionButton buildButtonSaved(BuildContext context) {
    return FloatingActionButton(
        backgroundColor: Colors.blue,
        child: Icon(MdiIcons.check),
        onPressed: () {
          Flushbar(
            duration: Duration(milliseconds: 1500),
            flushbarPosition: FlushbarPosition.TOP,
            backgroundColor: Color(0xFF03fca1),
            message: "Berita sudah tersimpan!",
          )..show(context);
        });
  }

  FloatingActionButton buildButtonSave(BuildContext context) {
    return FloatingActionButton(
        backgroundColor: Colors.blue,
        child: Icon(MdiIcons.briefcasePlusOutline),
        onPressed: () {
          NewsSave.saveNews(news: widget.news).then((value) {
            setState(() {
              isSaved = true;
            });
            Flushbar(
              duration: Duration(milliseconds: 1500),
              flushbarPosition: FlushbarPosition.TOP,
              backgroundColor: Color(0xFF03fca1),
              message: "Berita berhasil disimpan!",
            )..show(context);
          });
        });
  }
}
