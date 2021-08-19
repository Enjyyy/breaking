import 'package:flutter/material.dart';
import 'package:breaking/CustomWidgets.dart';
import 'package:breaking/Data.dart';

class CategoryScreen extends StatefulWidget {
  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (choosenCategory == '') {
      getNews();
    } else if (choosenCategory == 'Politics') {
      getPoliticsNews();
    } else if (choosenCategory == 'Sports') {
      getSportsNews();
    } else if (choosenCategory == 'Science & Technology') {
      getScienceTechNews();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          child: ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            itemCount: articles.length,
            itemBuilder: (context, index) {
              return ArticleDiv(
                  func: () {},
                  imgSrc: articles[index].imgSrc,
                  info: articles[index].info,
                  header: articles[index].header,
                  author: articles[index].author);
            },
            shrinkWrap: true,
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
          ),
        ),
      ),
    );
  }
}
