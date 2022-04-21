import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_vietnam_covid19/src/bloc/drawer/drawer_bloc.dart';
import 'package:flutter_vietnam_covid19/src/bloc/drawer/drawer_event.dart';
import 'package:flutter_vietnam_covid19/src/constant/theme.dart';
import 'package:flutter_vietnam_covid19/src/data/model/menu.dart';
import 'package:flutter_vietnam_covid19/src/page/tabs/tabs_page.dart';
import 'package:flutter_vietnam_covid19/src/widget/drawer/my_drawer.dart';

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
        child: BlocBuilder(
          builder: (BuildContext context, state) {
            return _scaffold(context);
          },
        ),
      ),
    );
  }

  Widget _scaffold(BuildContext context) {
    final bloc = BlocProvider.of<DrawerBloc>(context);

    Widget _dashboard(
        {required Animation<double> scaleAnimation,
        required double screenWidth,
        Color? color}) {
      return MyDrawer(
          isCollapsed: !drawerShow,
          width: screenWidth,
          duration: const Duration(microseconds: 200),
          scaleAnimation: scaleAnimation,
          onMenuTap: () {
            BlocProvider.of<DrawerBloc>(_globalKey.currentContext!).add(
                MenuEvent(isCollapsed: false, newIndex: bloc.currentPageIndex));
          },
          child: color == null
              ? InkWell(
                  onTap: () {
                    bloc.add(MenuEvent(
                        isCollapsed: false, newIndex: bloc.currentPageIndex));
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(
                        Radius.circular(drawerShow ? 30.0 : 0)),
                    child: TabsPage(
                      drawerTap: (index) {
                        bloc.currentPageIndex = index;
                        bloc.add(MenuEvent(isCollapsed: true, newIndex: index));
                      },
                    ),
                  ),
                )
              : Material(
                  borderRadius: const BorderRadius.all(Radius.circular(30)),
                  color: color));
    }

    Widget _menuBar() {
      Widget _menuItem({required MenuTabItem item}) {
        bool isSelected = item.id == bloc.currentPageIndex;

        return InkWell(
          onTap: () {
            bloc.add(MenuEvent(isCollapsed: false, newIndex: item.id));
          },
          child: Container(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Icon(
                  item.iconData,
                  color: isSelected ? ThemePrimary.primaryColor :
                  ThemePrimary.textPrimaryColor,
                ),
                const SizedBox(
                  width: 8.0,
                ),
                Expanded(
                    child: Text(
                  item.title,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: Theme.of(context).textTheme.bodyText2!.copyWith(
                      fontWeight:
                          isSelected ? FontWeight.bold : FontWeight.normal,
                      color: isSelected
                          ? ThemePrimary.primaryColor
                          : ThemePrimary.textPrimaryColor),
                ))
              ],
            ),
          ),
        );
      }

      return InkWell(
        onTap: (){
          bloc.add(MenuEvent(isCollapsed: false, newIndex: bloc.currentPageIndex));
        },
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: ThemePrimary.primaryColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
                SafeArea(child: Container(
                  width: MediaQuery.of(context).size.width * 0.55,
                  margin: const EdgeInsets.only(top: 16),
                  child: Center(
                    child: Container(
                      child: Center(
                        child: Image.asset("/assets/icons/news.png",
                        fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                ))
            ],
          ),
        ),
      );
    }

    return Scaffold(
      key: _globalKey,
      body: Stack(
        children: [
          _menuBar(),
          // _dashboard(),
          // _dashboard(),
          // _dashboard()
        ],
      ),
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
}
