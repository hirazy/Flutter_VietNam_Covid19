import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  final bool isCollapsed;
  final double? width;
  final Duration duration;
  final Function onMenuTap;
  final Animation<double> scaleAnimation;
  final Widget child;

  MyDrawer({Key? key,
    required this.isCollapsed,
    required this.width,
    required this.duration,
    required this.scaleAnimation,
    required this.onMenuTap,
    required this.child})
      : super();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return AnimatedPositioned(
      child: ScaleTransition(
        scale: scaleAnimation,
        child: Material(
          animationDuration: duration,
          borderRadius: BorderRadius.all(Radius.circular(40)),
          elevation: 0,
          child: child,
        ),
      ),
      duration: duration,
      top: 0,
      bottom: 0,
      left: isCollapsed ? 0 : 0.45 * MediaQuery
          .of(context)
          .size
          .width,
      right: isCollapsed ? 0: -0.35 * MediaQuery
          .of(context)
          .size
          .width,
    );
  }
}
