import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vietnam_covid19/src/page/drawer/drawer_page.dart';
import 'package:flutter_vietnam_covid19/src/page/home/home_page.dart';
import 'package:flutter_vietnam_covid19/src/page/splash/splash_page.dart';

class AppRoutes{
  static Route generateRoute(RouteSettings  settings){
    switch(settings.name){
      case SplashPage.routeName:
        return MaterialPageRoute(builder: (context) => SplashPage(),
          settings: const RouteSettings(name: SplashPage.routeName));
        break;
      case DrawerPage.routeName:
        return MaterialPageRoute(builder: (context) => DrawerPage(),
        settings: const RouteSettings(name: DrawerPage.routeName));
        break;

      case HomePage.routeName:
        return MaterialPageRoute(builder: (context) => HomePage(),
          settings: const RouteSettings(name: HomePage.routeName));
        break;

      default:
        return MaterialPageRoute(builder: (context) => HomePage(),
        settings: const RouteSettings(name: HomePage.routeName));
    }
  }
}