part of 'pages.dart';

class NewsSavePage extends StatefulWidget {
  @override
  _NewsSavePageState createState() => _NewsSavePageState();
}

class _NewsSavePageState extends State<NewsSavePage> {
  @override
  Widget build(BuildContext context) {
    List<News> newsSave;
    return SafeArea(
      child: Scaffold(
          body: ListView(
        children: <Widget>[
          Container(
            margin: EdgeInsets.fromLTRB(defaultMargin, 20, defaultMargin, 10),
            child: Text("Berita Tersimpan",
                style: blackTextFont.copyWith(
                    fontSize: 20, fontWeight: FontWeight.bold)),
          ),
          FutureBuilder(
            future: NewsSave.getAllSaveNews(),
            builder: (_, snapshot) {
              if (snapshot.hasData) {
                newsSave = snapshot.data;
                print("load $newsSave");
                return (newsSave.length < 1)
                    ? Container(
                        height: MediaQuery.of(context).size.height / 2,
                        child: Center(
                            child: Text("Tidak ada berita",
                                style: blackTextFont.copyWith(fontSize: 18))),
                      )
                    : ListView.builder(
                        shrinkWrap: true,
                        physics: ClampingScrollPhysics(),
                        itemCount: newsSave.length,
                        itemBuilder: (_, index) => Dismissible(
                              key: ValueKey(newsSave[index]),
                              direction: DismissDirection.endToStart,
                              confirmDismiss: (direction) async {
                                final result = await showDialog(
                                    context: context,
                                    builder: (_) => AlertDialog(
                                          title: Text("Perhatian"),
                                          content: Text(
                                              "Apakah anda yakin akan menghapus berita ini?"),
                                          actions: <Widget>[
                                            FlatButton(
                                                onPressed: () {
                                                  Navigator.of(context)
                                                      .pop(true);
                                                  setState(() {});
                                                },
                                                child: Text("Iya")),
                                            FlatButton(
                                                onPressed: () {
                                                  Navigator.of(context)
                                                      .pop(false);
                                                },
                                                child: Text("Tidak")),
                                          ],
                                        ));

                                if (result) {
                                  final deleteResult =
                                      await NewsSave.clearPerItem(
                                          name: newsSave[index].name);
                                  var message;
                                  if (deleteResult == null) {
                                    message = 'Berita berhasil dihapus!';
                                  } else {
                                    message = deleteResult?.errorMessage ??
                                        'Berita gagal dihapus!';
                                  }

                                  showDialog(
                                      context: context,
                                      builder: (_) => AlertDialog(
                                            title: Text('Berhasil!'),
                                            content: Text(message),
                                            actions: <Widget>[
                                              FlatButton(
                                                  onPressed: () {
                                                    Navigator.of(context).pop();
                                                  },
                                                  child: Text("ok"))
                                            ],
                                          ));
                                  return deleteResult?.data ?? false;
                                }
                                return result;
                              },
                              background: Container(
                                  color: Colors.red,
                                  padding: EdgeInsets.only(right: 16),
                                  child: Align(
                                    child: Icon(
                                      Icons.delete,
                                      color: Colors.white,
                                    ),
                                    alignment: Alignment.centerRight,
                                  )),
                              child: NewsSaveCard(newsSave[index], onTap: () {
                                context
                                    .bloc<PageBloc>()
                                    .add(GoToNewsDetailPage(newsSave[index]));
                              }),
                            ));
              } else {
                return SpinKitFadingCircle(
                  color: mainColor,
                  size: 50,
                );
              }
            },
          ),
        ],
      )),
    );
  }
}
