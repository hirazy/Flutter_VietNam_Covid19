import 'package:equatable/equatable.dart';

class TabPageState extends Equatable{
  final int index;

  const TabPageState({this.index = 0});



  @override
  // TODO: implement props
  List<Object?> get props => [index];
}