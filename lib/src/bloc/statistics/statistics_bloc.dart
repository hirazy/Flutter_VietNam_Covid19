import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vietnam_covid19/src/bloc/statistics/statistic_event.dart';
import 'package:flutter_vietnam_covid19/src/bloc/statistics/statistics_state.dart';
import 'package:flutter_vietnam_covid19/src/data/model/chart_data.dart';
import 'package:flutter_vietnam_covid19/src/data/model/province_model.dart';
import 'package:flutter_vietnam_covid19/src/data/model/sum_patient.dart';
import 'package:flutter_vietnam_covid19/src/widget/statistics/province_dialog.dart';

import '../../data/model/statistical_chart.dart';
import '../../data/remote/api.dart';

class StatisticBloc extends Bloc<StatisticEvent, StatisticsState> {
  SumPatient? sumPatient;
  List<Province> lstProvince = [];
  List<ChartData>? lstChartData;
  Province? provinceSelected;

  StatisticBloc() : super(const LoadingState()) {
    on<LoadEvent>(onLoadData);
    on<RefreshEvent>(onLoadData);
    on<ChangeProvinceEvent>(onChangeProvince);
  }

  void onLoadData(StatisticEvent event, Emitter<StatisticsState> emit) async {
    emit(const OnLoadingChartState());

    sumPatient = await Api.getSumPatient();

    List<StatisticalChartItem> _lstStatisticChart =
        await Api.getChartCovidByProvinceId();
    if (_lstStatisticChart != null) {
      lstChartData = createListChartData(_lstStatisticChart);
    }

    print("onLoadData" + sumPatient!.data.toString());

    lstProvince = await Api.getAllPatientProvinces();

    Province? province = Province();
    province.id = "";
    province.title = "Toàn quốc";
    lstProvince.insert(0, province);
    provinceSelected = lstProvince.first;

    emit(LoadingSuccessState());
    // sumPatient = await
  }

  void onChangeProvince(
      ChangeProvinceEvent event, Emitter<StatisticsState> emit) async {
    Province? newProvince = await showDialog(
        context: event.context,
        builder: (context) {
          return ProvinceDialog(
              provinceSelected: event.lastProvince, lstProvince: lstProvince);
        });

    if(newProvince != null){
      emit(OnLoadingChartState());

      provinceSelected = newProvince;
      List<StatisticalChartItem> lstStatisticalChart =
          await Api.getChartCovidByProvinceId(provinceId: provinceSelected!.id ?? "");

      if(lstStatisticalChart != null){
        lstChartData = createListChartData(lstStatisticalChart);
      }
    }

    emit(LoadingSuccessState());
  }

  List<ChartData> createListChartData(List<StatisticalChartItem> list) {
    List<ChartData> result = [];
    result = list
        .map((e) => ChartData(
              x: e.date,
              y: e.confirmed,
              secondSeriesYValue: e.death,
            ))
        .toList();
    return result;
  }
}
