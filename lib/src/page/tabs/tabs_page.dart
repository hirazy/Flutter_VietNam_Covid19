import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vietnam_covid19/src/bloc/tabpage/tabpage_state.dart';

class TabsPage extends StatefulWidget{

  final Function(int)? drawerTap;

  static const String routeName = "/tabsPage";

  const TabsPage({Key? key, this.drawerTap}): super(key: key);

  @override
  TabsPageState createState() {
    return TabsPageState();
  }
}

class TabsPageState extends State<TabsPage>{

  Widget body(TabPageState state, BuildContext context){
    return IndexedStack(
      index: state.index,
      children: [

      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

    );
  }

}