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
          List<Province>.from(json["list"].map((it) => Province.fromJson(it))).toList());
}

class Province {
  String? id;
  String? title;
  String? clsdeaths;
  Clslevel? clslevel;
  Clsconfirmed? clsconfirmed;
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
       this.clsconfirmed,
       this.onevaccinepercent,
       this.donevaccinepercent});

  factory Province.fromJson(Map<String, dynamic> json) => Province(
      id: json["id"] ?? "",
      title: json["title"] ?? "",
      clsdeaths: json["clsdeaths"] ?? "",
      level: json["level"] ?? 0,
      confirmed: json["confirmed"] ?? 0,
      incconfirmed: json["incconfirmed"] ?? 0,
      recovered: json["recovered"] ?? 0,
      deaths: json["deaths"] ?? 0,
      incdeath: json["incdeath"] ?? 0,
      onevaccine: json["onevaccine"] ?? 0,
      donevaccine: json["donevaccine"] ??0,
      onevaccinepercent: json["onevaccinepercent"] ?? 0,
      donevaccinepercent: json["donevaccinepercent"] ?? 0,
      clsconfirmed: clsconfirmedValues.map[json["clsconfirmed"]] ?? Clsconfirmed.INC,
      clslevel: clslevelValues.map[json["clslevel"]] ?? Clslevel.GREEN_ZONE
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "clsdeaths": clsdeaths,
    "clslevel": clslevelValues.reverse[clslevel],
    "clsconfirmed": clsconfirmedValues.reverse[clsconfirmed],
    "level": level,
    "confirmed": confirmed,
    "incconfirmed": incconfirmed,
    "recovered": recovered,
    "deaths": deaths,
    "incdeath": incdeath,
    "onevaccine": onevaccine,
    "donevaccine": donevaccine,
    "onevaccinepercent": onevaccinepercent,
    "donevaccinepercent": donevaccinepercent
  };
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

  Map<T, String> get reverse {
    reserveMap = map.map((key, value) => MapEntry(value, key));
    return reserveMap;
  }
}
