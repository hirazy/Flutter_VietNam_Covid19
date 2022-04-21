import 'package:equatable/equatable.dart';

abstract class DrawerEvent extends Equatable {
  const DrawerEvent();
}

class MenuEvent extends DrawerEvent {
  final bool isCollapsed;
  final int newIndex;

  const MenuEvent({required this.isCollapsed, required this.newIndex});

  @override
  List<Object?> get props => [];
}
