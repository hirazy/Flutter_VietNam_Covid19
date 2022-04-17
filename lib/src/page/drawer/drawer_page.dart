import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_vietnam_covid19/src/bloc/drawer/drawer_bloc.dart';
import 'package:flutter_vietnam_covid19/src/bloc/drawer/drawer_event.dart';
import 'package:flutter_vietnam_covid19/src/data/model/menu.dart';

import '../../bloc/drawer/drawer_state.dart';

class DrawerPage extends StatefulWidget {
  static const String routeName = "/drawer";

  @override
  DrawerPageState createState() {
    return DrawerPageState();
  }
}

class DrawerPageState extends State<DrawerPage>
    with SingleTickerProviderStateMixin {
  late GlobalKey _globalKey;
  late AnimationController _controller;
  late Animation<double> _scaleAnimation, _scaleAnimation2, _scaleAnimation3;
  bool drawerShow = false;

  @override
  void initState() {
    super.initState();

    _globalKey = GlobalKey();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
    _scaleAnimation = Tween<double>(begin: 1, end: 0.7).animate(_controller);
    _scaleAnimation2 = Tween<double>(begin: 1, end: 0.725).animate(_controller);
    _scaleAnimation3 = Tween<double>(begin: 1, end: 0.75).animate(_controller);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DrawerBloc(),
      child: BlocListener<DrawerBloc, DrawerState>(
        listener: (context, state) {
          blocListener(state, context);
        },
        child: _scaffold(),
      ),
    );
  }

  Widget _scaffold() {
    final bloc = BlocProvider.of<DrawerBloc>(context);

    return Container(

    );
  }

  Widget _dashboard(){
    return Container(

    );
  }

  void blocListener(DrawerState state, BuildContext context) {
    if (state is MenuCloseState) {
      _controller.reverse();
      drawerShow = false;
    } else {
      _controller.forward();
      drawerShow = true;
    }
  }

  List<MenuTabItem> _menuTabItem = MenuTabItem.menus;

  Widget _menuBar() {
    return Container(
      child: Text(""),
    );
  }
}
