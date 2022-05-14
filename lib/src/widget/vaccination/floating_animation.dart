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
      color: item.bubbleColor,
      padding: const EdgeInsets.only(top: 11, bottom: 13, left: 16, right: 16),
      splashColor: Colors.grey.withOpacity(0.1),
      highlightColor: Colors.grey.withOpacity(0.1),
      shape: const StadiumBorder(),
      onPressed: () {
        item.onPress();
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(
              child: Text(
            item.title,
            overflow: TextOverflow.ellipsis,
            style: item.textStyle,
          )),
          Icon(
            item.icon,
            color: item.iconColor,
          )
        ],
      ),
    );
  }
}

class _DefaultHeroTag {
  const _DefaultHeroTag();

  @override
  String toString() => '<default FloatingActionBubble tag>';
}

class FloatingActionBubble extends AnimatedWidget {
  final List<Bubble> items;
  Function onPress;
  final IconData? iconData;
  final Color backGroundColor;
  final AnimatedIconData? animatedIconData;
  final Object? herotag;
  final Color iconColor;

  FloatingActionBubble(
      {required this.items,
      required this.onPress,
      this.iconData,
      required Animation animation,
      this.herotag,
      required this.iconColor,
      this.animatedIconData,
      required this.backGroundColor})
      : assert((iconData == null && animatedIconData != null) ||
            (iconData != null && animatedIconData == null)),
        super(listenable: animation);

  get _animation => listenable;

  Widget buildItem(BuildContext context, int index) {
    final screenWidth = MediaQuery.of(context).size.width;

    TextDirection textDirection = Directionality.of(context);

    double animationDirection = textDirection == TextDirection.ltr ? -1 : 1;

    final transform = Matrix4.translationValues(
        animationDirection *
            (screenWidth - _animation.value * screenWidth) *
            ((items.length - index) / 4),
        0,
        0);

    return Align(
      alignment: textDirection == TextDirection.ltr
          ? Alignment.centerRight
          : Alignment.centerLeft,
      child: Transform(
        transform: transform,
        child: Opacity(
          opacity: _animation.value,
          child: BubbleMenu(
            item: items[index],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          margin: EdgeInsets.only(bottom: 10),
            child: IgnorePointer(
          ignoring: _animation.value == 0,
          child: ListView.separated(
              shrinkWrap: true,
              itemBuilder: buildItem,
              separatorBuilder: (_, __) => const SizedBox(height: 12.0),
              itemCount: items.length),
        )),
        FloatingActionButton(
          heroTag: herotag ?? const _DefaultHeroTag(),
          onPressed: () => onPress(),
          child: iconData == null
              ? AnimatedIcon(
                  icon: animatedIconData ?? AnimatedIcons.menu_arrow,
                  progress: _animation)
              : Icon(
                  iconData,
                  color: iconColor,
                ),
        ),
      ],
    );
  }
}
