import 'package:bloc/bloc.dart';
import 'package:flutter_vietnam_covid19/src/bloc/tabpage/tabpage_event.dart';
import 'package:flutter_vietnam_covid19/src/bloc/tabpage/tabpage_state.dart';
import 'package:flutter_vietnam_covid19/src/page/tabs/tabs_page.dart';

class TabPageBloc extends Bloc<TabPageEvent, TabPageState>{
  TabPageBloc(TabPageState initialState) : super(TabPageState(
    index: 0
  ));




}