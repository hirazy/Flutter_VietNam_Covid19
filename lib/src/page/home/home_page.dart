import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_vietnam_covid19/src/constant/constants.dart';
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
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
          systemNavigationBarColor: Constants.colorMain, // Navigation bar
          statusBarColor: Constants.colorMain, // Status bar
        ),
        leading: InkWell(
          child: Icon(Icons.menu),
          onTap: () {},
        ),
      ),
      body: Container(
          child: Column(
        children: [
          TopHomeWidget(onCall: onCall, onSendSMS: sendSMS),
          CenterHomeWidget()
        ],
      )),
    );
  }

  void onCall() {}

  void sendSMS() {}
}
