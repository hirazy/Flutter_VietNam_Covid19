import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vietnam_covid19/src/page/drawer/drawer_page.dart';
import 'package:flutter_vietnam_covid19/src/page/home/home_page.dart';
import 'package:flutter_vietnam_covid19/src/page/splash/splash_page.dart';
import 'package:flutter_vietnam_covid19/src/page/tabs/tabs_page.dart';

class AppRoutes{
  static Route generateRoute(RouteSettings  settings){
    switch(settings.name){
      case '/':
        return MaterialPageRoute(builder: (context) => DrawerPage(),
        settings: const RouteSettings(name: DrawerPage.routeName));

      // case SplashPage.routeName:
      //   return MaterialPageRoute(builder: (context) => SplashPage(),
      //     settings: const RouteSettings(name: SplashPage.routeName));
      //   break;
      case DrawerPage.routeName:
        return MaterialPageRoute(builder: (context) => DrawerPage(),
        settings: const RouteSettings(name: DrawerPage.routeName));

      case TabsPage.routeName:
        return MaterialPageRoute(builder: (context) => TabsPage(),
          settings: const RouteSettings(name: TabsPage.routeName)
        );

      case HomePage.routeName:
        return MaterialPageRoute(builder: (context) => HomePage(),
          settings: const RouteSettings(name: HomePage.routeName));
      default:
        return MaterialPageRoute(builder: (context) => HomePage(),
        settings: const RouteSettings(name: HomePage.routeName));
    }
  }
}