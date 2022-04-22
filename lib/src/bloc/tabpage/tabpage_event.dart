import 'package:equatable/equatable.dart';

abstract class TabPageEvent extends Equatable{
  const TabPageEvent();
}

class ChangeTabEvent extends TabPageEvent{
  final int newIndex;

  ChangeTabEvent({required this.newIndex});

  @override
  List<Object?> get props => [];
}