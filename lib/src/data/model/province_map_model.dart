import 'dart:convert';

import 'package:flutter_vietnam_covid19/src/data/model/province_model.dart';
import 'package:flutter_vietnam_covid19/src/data/model/sum_patient.dart';

ProvinceMapModel provinceMapModelFromJson(String json) =>
    ProvinceMapModel.fromJson(jsonDecode(json));

class ProvinceMapModel {
  List<ProvinceMap> list;

  ProvinceMapModel({required this.list});

  factory ProvinceMapModel.fromJson(Map<String, dynamic> json) =>
      ProvinceMapModel(
        list: List<ProvinceMap>.from(
            json["list"].map((x) => ProvinceMap.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "list": List<dynamic>.from(list.map((x) => x.toJson())),
      };
}

class ProvinceMap {
  String? name;
  String? color;
  List<Datum>? data;
  String? patientProvinceModel;

  ProvinceMap(
      {required this.name,
      required this.color,
      required this.data,
      required this.patientProvinceModel});

  factory ProvinceMap.fromJson(Map<String, dynamic> json) => ProvinceMap(
      name: json["name"],
      color: json["color"],
      data: json["data"] == null
          ? []
          : List<Datum>.from(json["data"].map((x) => Datum.fromJson(x)))
              .toList(),
      patientProvinceModel: json["patientProvinceModel"]);

  Map<String, dynamic> toJson() => {
    "name": name,
    "color": color,
    "data": data == null ? null : List<dynamic>.from(data!.map((e) => e.toJson())),
    "patientProvinceModel": patientProvinceModel ?? ""
  };
}

class Datum {
  String? id;
  String? title;
  String? clsconfirmed;
  String? clsdeaths;
  Clslevel? clslevel;
  int? donevaccine;
  int? onevaccine;
  int? recovered;
  int? incdeath;
  int? incconfirmed;
  int? level;
  int? confirmed;
  int? onevaccinepercent;
  int? donevaccinepercent;
  int? deaths;

  Datum({
    required this.id,
    required this.title,
    required this.clsconfirmed,
    required this.clsdeaths,
    required this.clslevel,
    required this.donevaccine,
    required this.onevaccine,
    required this.recovered,
    required this.incdeath,
    required this.incconfirmed,
    required this.level,
    required this.confirmed,
    required this.onevaccinepercent,
    required this.donevaccinepercent,
    required this.deaths,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
      id: json["id"],
      title: json["title"] ?? "",
      clsconfirmed: json["clsconfirmed"],
      clsdeaths: json["clsdeaths"],
      clslevel: clslevelValues.map[json["clslevel"]]!,
      donevaccine: json["donevaccine"],
      onevaccine: json["onevaccine"],
      recovered: json["recovered"],
      incdeath: json["incdeath"],
      incconfirmed: json["incconfirmed"],
      confirmed: json["confirmed"],
      level: json["level"],
      onevaccinepercent: json["onevaccinepercent"].toInt(),
      donevaccinepercent: json["donevaccinepercent"].toInt(),
      deaths: json["deaths"]);

  Map<String, dynamic> toJson() => {
    "id": this.id,
    "title": this.title,
    "clsconfirmed": clsconfirmed,
    "clsdeaths": clsdeaths,
    "clslevel": clslevel,
    "donevaccine": donevaccine,
    "onevaccine": onevaccine,
    "recovered": recovered,
    "incdeath": incdeath,
    "incconfirmed": incconfirmed,
    "confirmed": confirmed,
    "level": level,
    "onevaccinepercent": onevaccinepercent,
    "donevaccinepercent": donevaccinepercent,
    "deaths": deaths
  };
}

enum Clslevel { RED_ZONE }

final clslevelValues = EnumValues({"red-zone": Clslevel.RED_ZONE});

class EnumValues<T> {
  late Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((key, value) => MapEntry(value, key));
    return reverseMap;
  }
}
