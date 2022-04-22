import 'package:bloc/bloc.dart';
import 'package:flutter_vietnam_covid19/src/bloc/tabpage/tabpage_event.dart';
import 'package:flutter_vietnam_covid19/src/bloc/tabpage/tabpage_state.dart';

class TabPageBloc extends Bloc<TabPageEvent, TabPageState> {
  TabPageBloc() : super(const TabPageState(index: 0)) {
    on<ChangeTabEvent>(_onChangeTab);
  }

  void _onChangeTab(ChangeTabEvent event, Emitter<TabPageState> emitter) {
    int _index = event.newIndex;
    emit(state.copyWith(index: _index));
  }
}
