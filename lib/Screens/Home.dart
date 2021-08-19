import 'package:breaking/Screens/Category.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:breaking/CustomWidgets.dart';
import 'package:breaking/Data.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    setState(() {
      getNews();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(
          title: Center(child: Text('DAILY NEWS')),
        ),
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                Container(
                  height: 110,
                  child: ListView.builder(
                    shrinkWrap: true,
                    padding: EdgeInsets.all(10),
                    itemCount: category.length,
                    itemBuilder: (context, index) {
                      return NewsCategory(
                        imgSrc: category[index][0],
                        imgTxt: category[index][1],
                        func: () {
                          setState(() {
                            choosenCategory = category[index][1];
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => CategoryScreen()));
                          });
                        },
                      );
                    },
                    scrollDirection: Axis.horizontal,
                  ),
                ),
                Container(
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
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
