import 'package:flutter/cupertino.dart';

class MyDrawer extends StatelessWidget {

  final bool isCollapsed;
  final double? width;
  final Duration duration;
  final Function onMenuTap;
  final Widget child;

  MyDrawer({
    Key? key,
    required this.isCollapsed,
    required this.width,
    required this.duration,
    required this.onMenuTap,
    required this.child
  }) : super();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return AnimatedPositioned(child: child, duration: duration);
  }
}
