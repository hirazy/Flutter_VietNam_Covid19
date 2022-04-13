import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vietnam_covid19/src/data/model/menu.dart';

class DrawerPage extends StatefulWidget{

  static const String routeName = "/drawer";

  @override
  DrawerState createState() {
   return DrawerState();
  }
}

class DrawerState extends State<DrawerPage>
      with SingleTickerProviderStateMixin{

  late GlobalKey _globalKey;
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _globalKey = GlobalKey();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _scaffold(),
    );
  }

  Widget _scaffold(){
    return Container(

    );
  }

  List<MenuTabItem> _menuTabItem = MenuTabItem.menus;


}