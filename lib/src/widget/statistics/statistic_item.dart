import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../constant/theme.dart';

class StatisticItem extends StatelessWidget {
  Color backgroundColor;
  String title;
  int value;
  int? plusValue;

  StatisticItem(
      {Key? key,
      required this.backgroundColor,
      required this.title,
      required this.value,
      this.plusValue})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Expanded(
      child: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          ThemePrimary.primaryColor,
          ThemePrimary.primaryColor.withOpacity(0.4)
        ], begin: Alignment.topRight, end: Alignment.bottomLeft)),
        child: Column(
          children: [
            Text(title),
            Text(
              "${value}",
              style: Theme.of(context)
                  .textTheme
                  .headline3
                  ?.copyWith(color: Colors.white),
            ),
            Text(
              "",
              style: TextStyle(),
            )
          ],
        ),
      ),
    ));
  }
}
