import 'package:bloc/bloc.dart';
import 'package:flutter_vietnam_covid19/src/bloc/drawer/drawer_event.dart';

import 'drawer_state.dart';

class DrawerBloc extends Bloc<DrawerEvent, DrawerState>{

  int currentPageIndex = 0;

  DrawerBloc() : super(const DrawerState()){
    on<MenuEvent>((event, emit) {
      emit(
        event.isCollapsed ?
            MenuOpenState(newIndex: event.newIndex):
            MenuCloseState(newIndex: event.newIndex)
      );
    });
  }

}