import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StatisticPage extends StatefulWidget{

  static const String routeName = "/statistic";

  @override
  State<StatefulWidget> createState() {
    return StatisticState();
  }
}

class StatisticState extends State<StatisticPage>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Text("Hehe"),
      ),
    );
  }
}