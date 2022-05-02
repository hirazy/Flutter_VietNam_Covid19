import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vietnam_covid19/src/data/model/news_model.dart';
import 'package:flutter_vietnam_covid19/src/page/drawer/drawer_page.dart';
import 'package:flutter_vietnam_covid19/src/page/home/home_page.dart';
import 'package:flutter_vietnam_covid19/src/page/news_detail/news_detail_page.dart';
import 'package:flutter_vietnam_covid19/src/page/tabs/tabs_page.dart';

class AppRoutes {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
            builder: (context) => DrawerPage(),
            settings: const RouteSettings(name: DrawerPage.routeName));

      // case SplashPage.routeName:
      //   return MaterialPageRoute(builder: (context) => SplashPage(),
      //     settings: const RouteSettings(name: SplashPage.routeName));
      //   break;
      case DrawerPage.routeName:
        return MaterialPageRoute(
            builder: (context) => DrawerPage(),
            settings: const RouteSettings(name: DrawerPage.routeName));

      case TabsPage.routeName:
        return MaterialPageRoute(
            builder: (context) => TabsPage(),
            settings: const RouteSettings(name: TabsPage.routeName));

      case HomePage.routeName:
        return MaterialPageRoute(
            builder: (context) => HomePage(),
            settings: const RouteSettings(name: HomePage.routeName));

      case NewsDetailPage.routName:
        return MaterialPageRoute(
            builder: (context) => NewsDetailPage(
                  model: settings.arguments as NewsModel,
                ),
            settings: const RouteSettings(name: NewsDetailPage.routName));

      default:
        return MaterialPageRoute(
            builder: (context) => HomePage(),
            settings: const RouteSettings(name: HomePage.routeName));
    }
  }
}
