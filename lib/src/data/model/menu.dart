import 'package:flutter/cupertino.dart';
import 'package:flutter_vietnam_covid19/src/page/map/maps_page.dart';
import 'package:flutter_vietnam_covid19/src/page/statistic/statistic_page.dart';
import 'package:flutter_vietnam_covid19/src/page/vaccination/vaccination_page.dart';
import 'package:line_icons/line_icons.dart';
import '../../page/home/home_page.dart';
import '../../page/news/news_page.dart';

class MenuTabItem {
  final int id;
  final String title;
  final String appBarTitle;
  final Widget widget;
  final IconData iconData;
  final String routeName;

  MenuTabItem(
      {required this.id,
      required this.title,
      required this.appBarTitle,
      required this.widget,
      required this.iconData,
      required this.routeName});

  static List<MenuTabItem> menus = [
    MenuTabItem(
        id: 0,
        title: "Trang chủ",
        appBarTitle: "Trang chủ",
        widget: HomePage(),
        iconData: LineIcons.home,
        routeName: HomePage.routeName),
    MenuTabItem(
        id: 1,
        title: "Thống kê",
        appBarTitle: "Thống kê ca nhiễm",
        widget: StatisticPage(),
        iconData: LineIcons.barChartAlt,
        routeName: StatisticPage.routeName),
    MenuTabItem(
        id: 2,
        title: "Trang chủ",
        appBarTitle: "Trang chủ",
        widget: VaccinationPage(),
        iconData: LineIcons.home,
        routeName: VaccinationPage.routeName),
    MenuTabItem(
        id: 3,
        title: "Map",
        appBarTitle: "Map",
        widget: MapsPage(),
        iconData: LineIcons.home,
        routeName: MapsPage.routeName),
    MenuTabItem(
        id: 4,
        title: "News",
        appBarTitle: "News",
        widget: NewsPage(),
        iconData: LineIcons.home,
        routeName: NewsPage.routeName),
  ];
}
