import 'dart:convert';
import 'package:breaking/CustomWidgets.dart';
import 'package:http/http.dart' as http;

final category = [
  ['assets/breakingimg.jpg', ''],
  ['assets/politics.jpg', 'Politics'],
  ['assets/sports.jpg', 'Sports'],
  ['assets/sciencetech.jpg', 'Science & Technology']
];

List<ArticleDiv> articles = [];

Future<void> getNews() async {
  String url =
      'https://newsapi.org/v2/everything?q=tesla&from=2021-07-18&sortBy=publishedAt&apiKey=ee4702e3048d4180a85690b373d48334';
  var response = await http.get(Uri.parse(url));
  var jsonData = jsonDecode(response.body);
  if (jsonData["status"] == "ok") {
    jsonData["articles"].forEach((div) {
      ArticleDiv article = ArticleDiv(
          imgSrc: div["urlToImage"].toString(),
          info: div["content"].toString(),
          header: div["title"].toString(),
          author: div["author"].toString());
      articles.add(article);
      print(articles[articles.length - 1].author);
    });
  }
}
