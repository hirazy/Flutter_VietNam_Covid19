import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_vietnam_covid19/src/bloc/drawer/drawer_bloc.dart';
import 'package:flutter_vietnam_covid19/src/bloc/drawer/drawer_event.dart';
import 'package:flutter_vietnam_covid19/src/bloc/drawer/drawer_state.dart';
import 'package:flutter_vietnam_covid19/src/bloc/tabpage/tabpage_bloc.dart';
import 'package:flutter_vietnam_covid19/src/bloc/tabpage/tabpage_event.dart';
import 'package:flutter_vietnam_covid19/src/bloc/tabpage/tabpage_state.dart';
import 'package:flutter_vietnam_covid19/src/constant/theme.dart';
import 'package:flutter_vietnam_covid19/src/data/model/menu.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class TabsPage extends StatefulWidget {
  final Function(int)? drawerTap;

  static const String routeName = "/tabsPage";

  const TabsPage({Key? key, this.drawerTap}) : super(key: key);

  @override
  TabsPageState createState() {
    return TabsPageState();
  }
}

class TabsPageState extends State<TabsPage> {
  final GlobalKey<ScaffoldState> tabsKey = GlobalKey();

  Widget body(TabPageState state, BuildContext context) {
    return IndexedStack(
      index: state.index,
      children: [...MenuTabItem.menus.map((e) => e.widget)],
    );
  }

  Widget _bottomNavigationBar(TabPageState state, BuildContext context) {
    Color _selectedColor = ThemePrimary.primaryColor;
    return SafeArea(
        child: SalomonBottomBar(
          currentIndex: state.index,
            onTap: (index) {
              context.read<TabPageBloc>().add(ChangeTabEvent(newIndex: index));
            },
            items: MenuTabItem.menus
                .map((e) => SalomonBottomBarItem(
                    icon: Icon(e.iconData), title: Text(e.title, overflow: TextOverflow.ellipsis,),
                selectedColor: _selectedColor))
                .toList()));
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TabPageBloc(),
      child: BlocBuilder<TabPageBloc, TabPageState>(builder: (context, state) {
        return BlocListener<DrawerBloc, DrawerState>(
          listener: (context, state) {
            if (state is MenuCloseState) {
              context
                  .read<TabPageBloc>()
                  .add(ChangeTabEvent(newIndex: state.newIndex));
            }
          },
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: ThemePrimary.primaryColor,
              elevation: 0,
              centerTitle: true,
              leading: IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () {
                  // context
                  //     .read<DrawerBloc>()
                  //     .add(MenuEvent(isCollapsed: isCollapsed, newIndex: newIndex))
                  widget.drawerTap!(state.index);
                },
              ),
            ),
            body: body(state, context),
            bottomNavigationBar: _bottomNavigationBar(state, context),
          ),
        );
      }),
    );
  }
}
