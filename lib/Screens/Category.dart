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
      articles = politicsArticles;
    } else if (choosenCategory == 'Sports') {
      getSportsNews();
      articles = sportsArticles;
    } else if (choosenCategory == 'Science & Technology') {
      getScienceTechNews();
      articles = scienceTechArticles;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$choosenCategory'),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            itemCount: articles.length,
            itemBuilder: (context, index) {
              return ArticleDiv(
                imgSrc: articles[index].imgSrc,
                info: articles[index].info,
                header: articles[index].header,
                author: articles[index].author,
                urll: articles[index].urll,
              );
            },
            shrinkWrap: true,
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
          ),
        ),
      ),
    );
  }
}
