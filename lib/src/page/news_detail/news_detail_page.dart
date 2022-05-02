import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_vietnam_covid19/src/constant/theme.dart';
import 'package:flutter_vietnam_covid19/src/data/model/news_model.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

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
    return WebviewScaffold(url: widget.model.link,
      appBar: AppBar(
        backgroundColor: ThemePrimary.primaryColor,
        title: Text(widget.model.title),
      ),
      initialChild: Container(
        child: Center(
          child: SpinKitFadingFour(
            color: ThemePrimary.primaryColor,
            size: 24,
          ),
        ),
      ),
    );
  }
}