import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../widget/home/widget_center_home.dart';
import '../../widget/home/widget_top_home.dart';

class HomePage extends StatefulWidget {
  static const String routeName = "/home";

  @override
  HomeState createState() {
    return HomeState();
  }
}

class HomeState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   systemOverlayStyle: const SystemUiOverlayStyle(
      //     systemNavigationBarColor: Constants.colorMain, // Navigation bar
      //     statusBarColor: Constants.colorMain, // Status bar
      //   ),
      //   leading: InkWell(
      //     child: Icon(Icons.menu),
      //     onTap: () {},
      //   ),
      // ),
      body: Container(
          child: SingleChildScrollView(
        child: Column(
          children: [
            TopHomeWidget(onCall: onCall, onSendSMS: sendSMS),
            CenterHomeWidget()
          ],
        ),
      )),
    );
  }

  void onCall() {
    print("onCall");
    launch("tel://21213123123");
    // launchUrl(Uri.parse("tel://21213123123"));
  }

  void sendSMS() {}
}
