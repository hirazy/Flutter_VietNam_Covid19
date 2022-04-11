import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewsPage extends StatefulWidget{

  static const String routeName = "/news";

  @override
  NewsState createState() {
    return NewsState();
  }

}

class NewsState extends State<NewsPage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Text("Hello"),
      ),
    );
  }

}