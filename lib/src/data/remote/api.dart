import 'dart:convert';

import 'package:flutter_vietnam_covid19/src/data/model/news_model.dart';
import 'package:flutter_vietnam_covid19/src/data/model/province_model.dart';
import 'package:flutter_vietnam_covid19/src/data/model/statistical_chart.dart';
import 'package:flutter_vietnam_covid19/src/data/model/sum_patient.dart';
import 'package:flutter_vietnam_covid19/src/helper/rss_helper.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart' as dio;
import 'package:intl/intl.dart';
import 'package:webfeed/webfeed.dart';

import '../model/chart_data.dart';

class Api {
  static const String _domain = "https://emag.thanhnien.vn/covid19/home";

  static const String _urlNews =
      "https://thanhnien.vn/rss/thoi-su/dan-sinh-176.rss";

  static const String _routeGetChartCovid = "GetChartCovid";

  static Future<List<StatisticalChartItem>> getChartCovidByProvinceId(
      {String? provinceId}) async {
    provinceId ??= "";

    List<StatisticalChartItem> _res = [];

    try {
      var url = Uri.parse('$_domain/GetChartCovid');
      http.Response response = await http.post(url);

      if (response.statusCode == 200) {
        _res = statisticalChart(response.body).list;

        return _res;
      }
    } catch (e) {}

    return _res;
  }

  static Future<List<Province>> getAllPatientProvinces() async{
    List<Province> _result = [];

    try{
      var url = Uri.parse('$_domain/getAllPatientProvinces');
      http.Response response = await http.post(url);

      _result = provinceModelFromJson(response.body).data;

      return _result;
    }
    catch(e){
    }

    return _result;
  }

  static Future<SumPatient?> getSumPatient() async {
    SumPatient? _res;

    var url = Uri.parse('${_domain}/${_routeGetChartCovid}');
    try {
      http.Response response = await http.post(url);

      if (response.statusCode == 200) {
        _res = sumPatientFromJson(json.decode(response.body));
        print("getSumPatient " + response.body);
        return _res;
      }
    } catch (e) {
      print(e);
    }
    return _res;
  }

  static Future<RssFeed?> getNewsCovid() async {
    try {
      Uri uri = Uri.parse(_urlNews);
      http.Response response = await http.get(uri);
      String body = utf8.decode(response.bodyBytes);

      print("List Covid " + body);

      return RssFeed.parse(body);
    } catch (e) {}
    return null;
  }

  static Future<List<NewsModel>> getListCovidNews() async {
    var rssFeed = await getNewsCovid();

    List<NewsModel> lstNews = [];

    try {
      if (rssFeed != null) {
        print("List Model ");
        for (var item in rssFeed.items!) {
          lstNews.add(NewsModel(
              title: item.title!!,
              pubDate: DateFormat('dd/MM/yyyy').format(item.pubDate!),
              image: RssHelper.getImageFromFeed(item.description!),
              link: item.link!.replaceAll('\'', "")));
        }

        for (int index = 0; index < 6; index++) {
          lstNews[index].image = RssHelper.changeSizeImage(
              url: lstNews[index].image, width: 200, height: 80);
        }
      }
    } catch (e) {}
    return lstNews;
  }


// static Future<List<NewsModel?>> getListCovidNews(){
//
//   var url = Uri.parse('${_urlNews}');
//
//   var rssNews = http.get(url);
//
// }
}
