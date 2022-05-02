import 'dart:convert';

import 'package:flutter_vietnam_covid19/src/data/model/province_map_model.dart';

ProvinceModel provinceModelFromJson(String str) =>
    ProvinceModel.fromJson(json.decode(str));

class ProvinceModel {
  bool success;
  List<Province> data;

  ProvinceModel({required this.success, required this.data});

  factory ProvinceModel.fromJson(Map<String, dynamic> json) => ProvinceModel(
      success: json["success"],
      data:
          List<Province>.from(json["data"].map((it) => Province.fromJson(it))));
}

class Province {
  String? id;
  String? title;
  String? clsdeaths;

  Clslevel? clslevel;
  int? level;
  int? confirmed;
  int? incconfirmed;
  int? recovered;
  int? deaths;
  int? incdeath;
  int? onevaccine;
  int? donevaccine;
  double? onevaccinepercent;
  double? donevaccinepercent;

  Province(
      { this.id,
       this.title,
       this.clsdeaths,
       this.level,
       this.confirmed,
       this.clslevel,
       this.incconfirmed,
       this.recovered,
       this.deaths,
       this.incdeath,
       this.onevaccine,
       this.donevaccine,
       this.onevaccinepercent,
       this.donevaccinepercent});

  factory Province.fromJson(Map<String, dynamic> json) => Province(
      id: json["id"],
      title: json["title"],
      clsdeaths: json["clsdeaths"],
      level: json["level"],
      confirmed: json["confirmed"],
      incconfirmed: json["incconfirmed"],
      recovered: json["recovered"],
      deaths: json["deaths"],
      incdeath: json["incdeath"],
      onevaccine: json["onevaccine"],
      donevaccine: json["donevaccine"],
      onevaccinepercent: json["onevaccinepercent"],
      donevaccinepercent: json["donevaccinepercent"],
      clslevel: clslevelValues.map[json["clslevel"]]!
  );
}

enum Clsconfirmed { INC }

final clsconfirmedValues = EnumValues({"inc": Clsconfirmed.INC});

enum Clslevel { GREEN_ZONE, YELLOW_ZONE, ORANGE_ZONE }

final clslevelValues = EnumValues({
  "green-zone": Clslevel.GREEN_ZONE,
  "yellow-zone": Clslevel.YELLOW_ZONE,
  "orange": Clslevel.ORANGE_ZONE,
});

class EnumValues<T> {
  late Map<String, T> map;
  late Map<T, String> reserveMap;

  EnumValues(this.map);

  Map<T, String> get reserve {
    reserveMap = map.map((key, value) => MapEntry(value, key));
    return reserveMap;
  }
}
