import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(8)),
            gradient: LinearGradient(
                colors: [backgroundColor, backgroundColor.withOpacity(0.4)],
                begin: Alignment.topRight,
                end: Alignment.bottomLeft),
                boxShadow: ThemePrimary.boxShadow
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              title,
              style: Theme.of(context)
                  .textTheme
                  .headline6!
                  .copyWith(color: Colors.white),
            ),
            Text(
              NumberFormat.decimalPattern().format(value),
              style: Theme.of(context)
                  .textTheme
                  .headline5
                  ?.copyWith(color: Colors.white),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                plusValue != null
                    ? const Icon(
                        Icons.arrow_upward,
                        size: 14,
                        color: Colors.white,
                      )
                    : SizedBox(),
                Text(
                    plusValue == null
                        ? ""
                        : NumberFormat.decimalPattern().format(value),
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .copyWith(color: Colors.white)),
              ],
            )
          ],
        ),
      ),
    ));
  }
}
