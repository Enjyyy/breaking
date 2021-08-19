import 'package:breaking/Data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:url_launcher/url_launcher.dart';
import 'Screens/Category.dart';

class NewsCategory extends StatelessWidget {
  NewsCategory(
      {required this.imgSrc, required this.imgTxt, required this.func});
  final String imgSrc;
  final String imgTxt;
  final VoidCallback func;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(right: 5),
      child: GestureDetector(
        onTap: func,
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                imgSrc,
                width: 120,
                height: 120,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(horizontal: 7),
              color: Colors.black12,
              width: 120,
              height: 120,
              child: Text(
                '$imgTxt',
                style: TextStyle(
                  color: Colors.white,
                  backgroundColor: Colors.red[900],
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ArticleDiv extends StatelessWidget {
  ArticleDiv(
      {required this.imgSrc,
      required this.info,
      required this.header,
      required this.author,
      required this.urll});
  final String imgSrc;
  final String header;
  final String info;
  final String author;
  final String urll;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 5),
      child: Column(
        children: [
          Image.network(imgSrc),
          GestureDetector(
            onTap: () => launchURL(urll),
            child: Text(
              header,
              style: TextStyle(
                  color: Colors.blue[400],
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 11),
          Text(
            'By: $author.',
            style: TextStyle(
              color: Colors.blue[900],
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 11),
          Text(
            info,
            style: TextStyle(fontSize: 17),
          ),
          SizedBox(height: 15),
          Container(
            color: Colors.grey,
            height: 5,
          )
        ],
      ),
    );
  }
}
