import 'package:equatable/equatable.dart';

class DrawerState extends Equatable {
  const DrawerState();

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class MenuCloseState extends DrawerState {
  final int newIndex;

  const MenuCloseState({required this.newIndex});

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class MenuOpenState extends DrawerState {
  final int newIndex;

  const MenuOpenState({
    required this.newIndex
  });

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
