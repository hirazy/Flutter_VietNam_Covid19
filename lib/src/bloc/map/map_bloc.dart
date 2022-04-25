import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_vietnam_covid19/src/bloc/map/map_event.dart';
import 'package:flutter_vietnam_covid19/src/bloc/map/map_state.dart';

class MapBloc extends Bloc<MapEvent, MapState>{
  // MapBloc(MapState initialState) : super(initialState);

  // MapBloc(): super MapState(){
  //
  // }

  MapBloc(): super( const MapState()){
    on<LoadEvent>(_onLoadData);
    on<RefreshEvent>(_onRefresh);
    on<WarningMapEvent>(_onWarning);
  }

  void _onLoadData(LoadEvent event, Emitter<MapState> emit) async{
    emit(const LoadingState());

    try{
      String data = rootBundle.loadString('assets/maps/vietnam.json') as String;

      var jsonResult = json.decode(data);



    }
    catch(e){

    }
  }

  void _onRefresh(RefreshEvent event, Emitter<MapState> state) async{

  }

  void _onWarning(WarningMapEvent event, Emitter<MapState> state) async{

  }


}