import 'dart:convert';
import 'package:breaking/CustomWidgets.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

final category = [
  ['assets/breakingimg.jpg', ''],
  ['assets/politics.jpg', 'Politics'],
  ['assets/sports.jpg', 'Sports'],
  ['assets/sciencetech.jpg', 'Science & Technology']
];

List<ArticleDiv> articles = [];
List<ArticleDiv> politicsArticles = [];
List<ArticleDiv> sportsArticles = [];
List<ArticleDiv> scienceTechArticles = [];
var choosenCategory;
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
          author: div["author"].toString(),
          urll: div["url"].toString());
      articles.add(article);
      print(articles[articles.length - 1].author);
    });
  }
}

Future<void> getPoliticsNews() async {
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
          author: div["author"].toString(),
          urll: div["url"].toString());
      politicsArticles.add(article);
      print(politicsArticles[politicsArticles.length - 1].author);
    });
  }
}

Future<void> getSportsNews() async {
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
          author: div["author"].toString(),
          urll: div["url"].toString());
      sportsArticles.add(article);
      print(sportsArticles[sportsArticles.length - 1].author);
    });
  }
}

Future<void> getScienceTechNews() async {
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
        author: div["author"].toString(),
        urll: div["url"].toString(),
      );
      scienceTechArticles.add(article);
      print(scienceTechArticles[scienceTechArticles.length - 1].author);
    });
  }
}

launchURL(String url) async {
  if (await canLaunch(url)) {
    await launch(
      url,
      forceWebView: true,
    );
  } else {
    throw 'Could not launch $url';
  }
}
