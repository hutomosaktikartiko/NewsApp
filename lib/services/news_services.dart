part of 'services.dart';

class NewsServices {
  static Future<List<News>> getNews({http.Client client}) async {
    String url =
        "http://newsapi.org/v2/top-headlines?country=id&apiKey=$apiKey";
    client ??= http.Client();
    var response = await http.get(url);
    if (response.statusCode != 200) {
      return [];
    }

    var data = json.decode(response.body);
    List result = data['articles'];

    return result.map((e) => News.fromJson(e)).toList();
  }

  static Future<List<News>> getNewsByCategory(String category,
      {http.Client client}) async {
    String url =
        "http://newsapi.org/v2/top-headlines?country=id&category=$category&apiKey=$apiKey";
    client ??= http.Client();
    var response = await http.get(url);
    if (response.statusCode != 200) {
      return [];
    }

    var data = json.decode(response.body);
    List result = data['articles'];

    return result.map((e) => News.fromJson(e)).toList();
  }

  static Future<List<News>> getNewsBySearch(String search,
      {http.Client client}) async {
    String url =
        "https://newsapi.org/v2/top-headlines?q=$search&apiKey=$apiKey";
    client ??= http.Client();
    var response = await http.get(url);
    if (response.statusCode != 200) {
      return [];
    }

    var data = json.decode(response.body);
    List result = data['articles'];

    return result.map((e) => News.fromJson(e)).toList();
  }
}
