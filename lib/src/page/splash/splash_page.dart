import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vietnam_covid19/src/page/drawer/drawer_page.dart';
import 'package:flutter_vietnam_covid19/src/page/home/home_page.dart';

class SplashPage extends StatefulWidget {
  static const String routeName = "/";

  @override
  State<StatefulWidget> createState() {
    return SplashState();
  }
}

class SplashState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 5),
        () => Navigator.pushNamed(context, DrawerPage.routeName));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Stack(
        children: [
          Container(
              width: double.infinity,
              height: double.infinity,
              child: Image.asset(
                'assets/images/bg_splash.jpg',
                fit: BoxFit.cover,
              )),
          Center(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "",
                  style: TextStyle(color: Colors.white),
                ),
                Image.asset("assets/images/ic_facemask.png")
              ],
            ),
          )
        ],
      ),
    ));
  }
}
