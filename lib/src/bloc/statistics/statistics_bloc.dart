import 'package:bloc/bloc.dart';
import 'package:flutter_vietnam_covid19/src/bloc/statistics/statistic_event.dart';
import 'package:flutter_vietnam_covid19/src/bloc/statistics/statistics_state.dart';
import 'package:flutter_vietnam_covid19/src/data/model/province_model.dart';
import 'package:flutter_vietnam_covid19/src/data/model/sum_patient.dart';

class StatisticBloc extends Bloc<StatisticEvent, StatisticsState>{

  SumPatient? sumPatient;
  List<Province> lstProvince = [];


  StatisticBloc() : super(const LoadingState()){
    on<LoadEvent>(onLoadData);
    on<RefreshEvent>(onLoadData);
    on<ChangeProvinceEvent>(onChangeProvince);
  }

  void onLoadData(StatisticEvent event, Emitter<StatisticsState> emit){


    emit(const OnLoadingChartState());


  }


  void onChangeProvince(ChangeProvinceEvent event, Emitter<StatisticsState> emit){


  }
}