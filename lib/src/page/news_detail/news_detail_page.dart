import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vietnam_covid19/src/data/model/news_model.dart';

class NewsDetailPage extends StatefulWidget{

  static const String routName = "/newsDetail";

  final NewsModel model;

  NewsDetailPage({Key? key, required this.model}): super(key: key);

  @override
  NewsDetailPageState createState() {
    return NewsDetailPageState();
  }
}

class NewsDetailPageState extends State<NewsDetailPage>{


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Text(
          ""
        ),
      ),
    );
  }
}