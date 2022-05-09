import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Bubble {
  Bubble(
      {required this.icon,
      required this.iconColor,
      required this.bubbleColor,
      required this.onPress,
      required this.title,
      required this.textStyle});

  final IconData icon;
  final Color iconColor;
  final Color bubbleColor;
  final Function onPress;
  final String title;
  final TextStyle textStyle;
}

class BubbleMenu extends StatelessWidget {
  BubbleMenu({required this.item});

  final Bubble item;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {
        item.onPress();
      },
      child: Row(
        children: [

        ],
      ),
    );
  }
}

class FloatingActionBubble extends StatelessWidget {
  final List<Bubble> items;
  Function onPress;
  final IconData? iconData;

  FloatingActionBubble(
      {required this.items, required this.onPress, required this.iconData});

  @override
  Widget build(BuildContext context) {
    throw UnimplementedError();
  }
}
