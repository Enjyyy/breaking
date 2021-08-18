import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class NewsCategory extends StatelessWidget {
  NewsCategory({required this.imgSrc, required this.imgTxt});
  final String imgSrc;
  final String imgTxt;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(right: 5),
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
          GestureDetector(
            onTap: () {},
            child: Container(
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
          ),
        ],
      ),
    );
  }
}

class ArticleDiv extends StatelessWidget {
  ArticleDiv(
      {required this.imgSrc,
      required this.info,
      required this.header,
      required this.author});
  final String imgSrc;
  final String header;
  final String info;
  final String author;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
      child: Column(
        children: [Image.network(imgSrc), Text(header), Text(info)],
      ),
    );
  }
}
