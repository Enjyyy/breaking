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
List<String> newsUrls = [
  'https://newsapi.org/v2/everything?domains=wsj.com&apiKey=ee4702e3048d4180a85690b373d48334',
  'https://newsapi.org/v2/top-headlines/sources?apiKey=ee4702e3048d4180a85690b373d48334',
  'https://newsapi.org/v2/top-headlines/country=eg&apiKey=ee4702e3048d4180a85690b373d48334'
];
Future<void> getNews() async {
  newsUrls.forEach((url) async {
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
        articles.add(article);
        print(articles[articles.length - 1].author);
      });
    }
  });
}

List<String> politicsNewsUrls = [
  'https://newsapi.org/v2/top-headlines?q=trump&apiKey=ee4702e3048d4180a85690b373d48334',
  ' https://newsapi.org/v2/top-headlines?country=eg&apiKey=Aee4702e3048d4180a85690b373d48334'
];
Future<void> getPoliticsNews() async {
  politicsNewsUrls.forEach((url) async {
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
  });
}

List<String> sportsNewsUrls = [
  'https://newsapi.org/v2/top-headlines?country=de&category=sports&apiKey=ee4702e3048d4180a85690b373d48334',
  'https://newsapi.org/v2/top-headlines?country=eg&category=sports&apiKey=ee4702e3048d4180a85690b373d48334'
];
Future<void> getSportsNews() async {
  sportsNewsUrls.forEach((url) async {
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
  });
}

List<String> scienceTechUrls = [
  'https://newsapi.org/v2/everything?q=tesla&from=2021-07-21&sortBy=publishedAt&apiKey=ee4702e3048d4180a85690b373d48334',
  'https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=ee4702e3048d4180a85690b373d48334',
];
Future<void> getScienceTechNews() async {
  scienceTechUrls.forEach((url) async {
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
  });
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
