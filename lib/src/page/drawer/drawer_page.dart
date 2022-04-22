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

// class DrawerPage extends StatefulWidget {
//   static const String routeName = "/drawer";
//
//   @override
//   DrawerPageState createState() {
//     return DrawerPageState();
//   }
// }
//
// class DrawerPageState extends State<DrawerPage>
//     with SingleTickerProviderStateMixin {
//   late GlobalKey _globalKey;
//   late AnimationController _controller;
//   late Animation<double> _scaleAnimation, _scaleAnimation2, _scaleAnimation3;
//   bool drawerShow = false;
//
//   @override
//   void initState() {
//     super.initState();
//
//     _globalKey = GlobalKey();
//
//     _controller = AnimationController(
//       vsync: this,
//       duration: const Duration(milliseconds: 200),
//     );
//     _scaleAnimation = Tween<double>(begin: 1, end: 0.7).animate(_controller);
//     _scaleAnimation2 = Tween<double>(begin: 1, end: 0.725).animate(_controller);
//     _scaleAnimation3 = Tween<double>(begin: 1, end: 0.75).animate(_controller);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => DrawerBloc(),
//       child: BlocListener<DrawerBloc, DrawerState>(
//         listener: (context, state) {
//           blocListener(state, context);
//         },
//         child: BlocBuilder<DrawerBloc, DrawerState>(
//           builder: (BuildContext context, state) {
//             return _scaffold(context);
//           },
//         ),
//       ),
//     );
//   }
//
//   Widget _scaffold(BuildContext context) {
//     final bloc = BlocProvider.of<DrawerBloc>(context);
//
//     Widget _dashboard(
//         {required Animation<double> scaleAnimation,
//         required double screenWidth,
//         Color? color}) {
//       return MyDrawer(
//           isCollapsed: !drawerShow,
//           width: screenWidth,
//           duration: const Duration(microseconds: 200),
//           scaleAnimation: scaleAnimation,
//           onMenuTap: () {
//             BlocProvider.of<DrawerBloc>(_globalKey.currentContext!).add(
//                 MenuEvent(isCollapsed: false, newIndex: bloc.currentPageIndex));
//           },
//           child: color == null
//               ? InkWell(
//                   onTap: () {
//                     bloc.add(MenuEvent(
//                         isCollapsed: false, newIndex: bloc.currentPageIndex));
//                   },
//                   child: ClipRRect(
//                     borderRadius: BorderRadius.all(
//                         Radius.circular(drawerShow ? 30.0 : 0)),
//                     child: TabsPage(
//                       drawerTap: (index) {
//                         bloc.currentPageIndex = index;
//                         bloc.add(MenuEvent(isCollapsed: true, newIndex: index));
//                       },
//                     ),
//                   ),
//                 )
//               : Material(
//                   borderRadius: const BorderRadius.all(Radius.circular(30)),
//                   color: color));
//     }
//
//     Widget _menuBar() {
//       Widget _menuItem({required MenuTabItem item}) {
//         bool isSelected = item.id == bloc.currentPageIndex;
//
//         return InkWell(
//           onTap: () {
//             bloc.add(MenuEvent(isCollapsed: false, newIndex: item.id));
//           },
//           child: Container(
//             width: MediaQuery.of(context).size.width * 0.5,
//             margin: const EdgeInsets.only(left: 8.0, bottom: 16.0),
//             decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(12), color: Colors.white),
//             padding: const EdgeInsets.all(8.0),
//             child: Row(
//               children: [
//                 Icon(
//                   item.iconData,
//                   color: isSelected
//                       ? ThemePrimary.primaryColor
//                       : ThemePrimary.textPrimaryColor,
//                   size: 24,
//                 ),
//                 const SizedBox(
//                   width: 8.0,
//                 ),
//                 Expanded(
//                     child: Text(
//                   item.title,
//                   overflow: TextOverflow.ellipsis,
//                   maxLines: 1,
//                   style: Theme.of(context).textTheme.bodyText2!.copyWith(
//                       fontWeight:
//                           isSelected ? FontWeight.bold : FontWeight.normal,
//                       color: isSelected
//                           ? ThemePrimary.primaryColor
//                           : ThemePrimary.textPrimaryColor),
//                 ))
//               ],
//             ),
//           ),
//         );
//       }
//
//       return InkWell(
//         onTap: () {
//           bloc.add(
//               MenuEvent(isCollapsed: false, newIndex: bloc.currentPageIndex));
//         },
//         child: Container(
//           width: MediaQuery.of(context).size.width,
//           height: MediaQuery.of(context).size.height,
//           color: ThemePrimary.primaryColor,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               SafeArea(
//                   child: Container(
//                     decoration: const BoxDecoration(
//                       shape: BoxShape.circle,
//                       color: Colors.white
//                     ),
//                 width: MediaQuery.of(context).size.width * 0.55,
//                 margin: const EdgeInsets.only(top: 16),
//                 child: Center(
//                   child: Container(
//                     padding: EdgeInsets.only(top: 16.0),
//                     child: Center(
//                       child: Image.asset(
//                         "assets/images/news.png",
//                         fit: BoxFit.fill,
//                       ),
//                     ),
//                   ),
//                 ),
//               )),
//               Container(
//                 width: MediaQuery.of(context).size.width * 0.5,
//                 padding: const EdgeInsets.only(top: 8, bottom: 16),
//                 child: Text(
//                   "VietNam Covid-19 News",
//                   textAlign: TextAlign.center,
//                   style: Theme.of(context)
//                       .textTheme
//                       .headline2!
//                       .copyWith(color: Colors.white),
//                 ),
//               ),
//               ...MenuTabItem.menus.map((item) => _menuItem(item: item)).toList(),
//               // Expanded(
//               //     child: Align(
//               //   alignment: Alignment.bottomCenter,
//               //   child: Text(
//               //     "Version 1.0.0",
//               //     style: Theme.of(context)
//               //         .textTheme
//               //         .bodyText1!
//               //         .copyWith(color: Colors.white),
//               //   ),
//               // ))
//               // Expanded(
//               //   child: Align(
//               //     alignment: Alignment.bottomCenter,
//               //     child: Container(
//               //       padding: const EdgeInsets.all(8.0),
//               //       child: Text(
//               //         "Version 1.0.0",
//               //         style: Theme.of(context)
//               //             .textTheme
//               //             .bodyText1!
//               //             .copyWith(color: Colors.white),
//               //       ),
//               //     ),
//               //   ),
//               // )
//               Expanded(
//                 child: Align(
//                   alignment: Alignment.bottomCenter,
//                   child: Container(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Text(
//                       "Version 1.0.0",
//                       style: Theme.of(context)
//                           .textTheme
//                           .bodyText1!
//                           .copyWith(color: Colors.white),
//                     ),
//                   ),
//                 ),
//               )
//             ],
//           ),
//         ),
//       );
//     }
//
//     return Scaffold(
//       key: _globalKey,
//       resizeToAvoidBottomInset: false,
//       body: Stack(
//         children: [
//           _menuBar(),
//           _dashboard(
//             screenWidth: MediaQuery.of(context).size.width / 1.04,
//             scaleAnimation: _scaleAnimation3,
//               color: ThemePrimary.backgroundColor
//           ),
//           _dashboard(
//               screenWidth: MediaQuery.of(context).size.width / 1.02,
//               scaleAnimation: _scaleAnimation2,
//               color: ThemePrimary.backgroundColor
//           ),
//           _dashboard(
//               screenWidth: MediaQuery.of(context).size.width,
//               scaleAnimation: _scaleAnimation,
//               color: ThemePrimary.backgroundColor
//           )
//         ],
//       ),
//     );
//   }
//
//   void blocListener(DrawerState state, BuildContext context) {
//     if (state is MenuCloseState) {
//       _controller.reverse();
//       drawerShow = false;
//     } else {
//       _controller.forward();
//       drawerShow = true;
//     }
//   }
//
//   List<MenuTabItem> _menuTabItem = MenuTabItem.menus;
// }

class DrawerPage extends StatefulWidget {
  static const String routeName = "/drawer";
  const DrawerPage({Key? key}) : super(key: key);

  @override
  _DrawerPageState createState() => _DrawerPageState();
}

class _DrawerPageState extends State<DrawerPage>
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
        vsync: this, duration: const Duration(milliseconds: 200));
    _scaleAnimation = Tween<double>(begin: 1, end: 0.7).animate(_controller);
    _scaleAnimation2 = Tween<double>(begin: 1, end: 0.725).animate(_controller);
    _scaleAnimation3 = Tween<double>(begin: 1, end: 0.75).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => DrawerBloc(),
        child: BlocListener<DrawerBloc, DrawerState>(
            listener: (context, state) => blocListener(state, context),
            child: BlocBuilder<DrawerBloc, DrawerState>(
                builder: (context, state) => _scaffold(context))));
  }

  void blocListener(DrawerState state, BuildContext context) {
    if (state is MenuCloseState) {
      _controller.reverse();
      drawerShow = false;
    } else if (state is MenuOpenState) {
      _controller.forward();
      drawerShow = true;
    }
  }

  Widget _scaffold(BuildContext context) {
    final bloc = BlocProvider.of<DrawerBloc>(context);

    Widget _dashboard(
        {required Animation<double> scaleAnimation,
          required double screenWidth,
          Color? color}) {
      return MyDrawer(
        duration: const Duration(milliseconds: 200),
        onMenuTap: () {
          BlocProvider.of<DrawerBloc>(_globalKey.currentContext!)
              .add(MenuEvent(isCollapsed: true, newIndex: bloc.currentPageIndex));
        },
        scaleAnimation: scaleAnimation,
        isCollapsed: !drawerShow,
        width: screenWidth,
        child: color == null
            ? InkWell(
          onTap: () {
            bloc.add(MenuEvent(isCollapsed: false, newIndex: bloc.currentPageIndex));
          },
          child: ClipRRect(
            borderRadius: BorderRadius.all(
              Radius.circular(drawerShow ? 30.0 : 0.0),
            ),
            child: TabsPage(
              drawerTap: (int pageIndex) {
                bloc.currentPageIndex = pageIndex;
                bloc.add(MenuEvent(isCollapsed: true, newIndex: bloc.currentPageIndex));
              },
            ),
          ),
        )
            : Material(
            borderRadius: const BorderRadius.all(Radius.circular(30.0)),
            color: color),
      );
    }

    Widget _menuBar() {
      Widget _item({required MenuTabItem menuTabItem}) {
        bool _isSelect = menuTabItem.id == bloc.currentPageIndex;
        return InkWell(
          onTap: () {
            bloc.add(MenuEvent(isCollapsed: false, newIndex: menuTabItem.id));
          },
          child: Container(
            padding: const EdgeInsets.all(8.0),
            width: MediaQuery.of(context).size.width * 0.5,
            margin: const EdgeInsets.only(left: 8.0, bottom: 16.0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12), color: Colors.white),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Icon(menuTabItem.iconData,
                    color: _isSelect
                        ? ThemePrimary.primaryColor
                        : ThemePrimary.textPrimaryColor,
                    size: 24.0),
                const SizedBox(width: 8.0),
                Expanded(
                    child: Text(menuTabItem.title,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: Theme.of(context).textTheme.bodyText2!.copyWith(
                            fontWeight:
                            _isSelect ? FontWeight.bold : FontWeight.w400,
                            color: _isSelect
                                ? ThemePrimary.primaryColor
                                : ThemePrimary.textPrimaryColor)))
              ],
            ),
          ),
        );
      }

      return InkWell(
        onTap: () {
          bloc.add(MenuEvent(isCollapsed: false, newIndex: bloc.currentPageIndex));
        },
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: ThemePrimary.primaryColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SafeArea(
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.55,
                  margin: const EdgeInsets.only(top: 16.0),
                  child: Center(
                    child: Container(
                      padding: const EdgeInsets.all(16.0),
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: Colors.white),
                      child: Center(
                        child: Image.asset(
                          "assets/images/news.png",
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.55,
                padding: const EdgeInsets.only(top: 8.0, bottom: 16.0),
                child: Text(
                  "VietNam Covid-19 News",
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .headline6!
                      .copyWith(color: Colors.white),
                ),
              ),
              ...MenuTabItem.menus
                  .map((e) => _item(menuTabItem: e))
                  .toList(),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Version 1.0.0",
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1!
                          .copyWith(color: Colors.white),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      );
    }

    return Scaffold(
      key: _globalKey,
      backgroundColor: ThemePrimary.primaryColor,
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: <Widget>[
          _menuBar(),
          _dashboard(
              scaleAnimation: _scaleAnimation3,
              screenWidth: MediaQuery.of(context).size.width / 1.04,
              color: ThemePrimary.backgroundColor),
          _dashboard(
              scaleAnimation: _scaleAnimation2,
              screenWidth: MediaQuery.of(context).size.width / 1.02,
              color: Colors.teal),
          _dashboard(
              scaleAnimation: _scaleAnimation,
              screenWidth: MediaQuery.of(context).size.width,
              color: null),
        ],
      ),
    );
  }
}