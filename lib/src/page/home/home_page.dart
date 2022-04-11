import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {

  static String routeName = "/home";

  @override
  HomeState createState() {
    return HomeState();
  }
}

class HomeState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          InkWell(
            onTap: (){

            },
          )
        ],
      ),
      body: Container(
        child: Column(
          children: [

          ],
        )
      ),
    );
  }
}
