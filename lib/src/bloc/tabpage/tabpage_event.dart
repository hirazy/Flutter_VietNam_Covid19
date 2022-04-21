import 'package:equatable/equatable.dart';

abstract class TabPageEvent extends Equatable{
  const TabPageEvent();

}

class ChangeTabEvent extends TabPageEvent{
  final int newIndex;

  ChangeTabEvent({required this.newIndex});

  @override
  // TODO: implement props
  List<Object?> get props => [];
}