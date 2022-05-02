import 'package:flutter_vietnam_covid19/src/data/model/news_model.dart';
import 'package:flutter_vietnam_covid19/src/data/model/province_model.dart';
import 'package:flutter_vietnam_covid19/src/data/model/statistical_chart.dart';
import 'package:flutter_vietnam_covid19/src/data/model/sum_patient.dart';
import 'package:flutter_vietnam_covid19/src/data/remote/remote_data_source.dart';

class RemoteData extends RemoteDataSource{
  @override
  Future<List<Province>> getAllPatientProvince() {
    // TODO: implement getAllPatientProvince
    throw UnimplementedError();
  }

  @override
  Future<List<StatisticalChartItem>> getChartCovid() {
    // TODO: implement getChartCovid
    throw UnimplementedError();
  }

  @override
  Future<List<NewsModel>> getListCovidNews() {
    // TODO: implement getListCovidNews
    throw UnimplementedError();
  }

  @override
  Future<SumPatient> getSumPatient() {
    // TODO: implement getSumPatient
    throw UnimplementedError();
  }

}