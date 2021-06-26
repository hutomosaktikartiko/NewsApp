part of 'services.dart';

class NewsSave {
  static Future saveNews({News news}) async {
    final pref = await SharedPreferences.getInstance();

    pref.setStringList(news.name, [
      news.name,
      news.author,
      news.title,
      news.description,
      news.url,
      news.urlToImage,
      news.content
    ]).then(
        (value) => value ? print("Berhasil Simpan") : print("Gagal Simpan"));
  }

  static Future<List<News>> getAllSaveNews() async {
    final pref = await SharedPreferences.getInstance();

    var save = pref.getKeys();
    List<String> keys = [];
    List<News> listNews = [];
    save.forEach((element) {
      keys.add(element);
    });

    keys.forEach((element) {
      List<String> content = pref.getStringList(element);
      News news = News(
          name: content[0],
          author: content[1],
          title: content[2],
          description: content[3],
          url: content[4],
          urlToImage: content[5],
          content: content[6]);
      listNews.add(news);
    });
    
    return listNews;
  }

  static Future clearPerItem({String name}) async {
    final pref = await SharedPreferences.getInstance();

    pref.remove(name);
  }
}
