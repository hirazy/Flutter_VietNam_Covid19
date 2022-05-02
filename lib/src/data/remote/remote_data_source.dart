import 'package:flutter_vietnam_covid19/src/data/model/news_model.dart';
import 'package:flutter_vietnam_covid19/src/data/model/province_model.dart';
import 'package:flutter_vietnam_covid19/src/data/model/statistical_chart.dart';
import 'package:flutter_vietnam_covid19/src/data/model/sum_patient.dart';

abstract class RemoteDataSource {

  Future<List<StatisticalChartItem>> getChartCovid();

  Future<List<Province>> getAllPatientProvince();

  Future<List<NewsModel>> getListCovidNews();

  Future<SumPatient> getSumPatient();
}
