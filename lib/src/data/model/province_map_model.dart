import 'package:flutter_vietnam_covid19/src/data/model/province_model.dart';
import 'package:flutter_vietnam_covid19/src/data/model/sum_patient.dart';

class ProvinceMapModel {}

class ProvinceMap {
  String name;
  String color;
  List<Datum> data;
  String patientProvinceModel;

  ProvinceMap(
      {required this.name,
      required this.color,
      required this.data,
      required this.patientProvinceModel});
}

class Datum {
  String id;
  String title;
  Clsconfirmed clsconfirmed;
  String clsdeaths;
  Clslevel clslevel;
  int donevaccine;
  int onevaccine;
  int recovered;
  int incdeath;
  int incconfirmed;
  int level;
  int onevaccinepercent;
  int donevaccinepercent;
  int deaths;

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
    required this.onevaccinepercent,
    required this.donevaccinepercent,
    required this.deaths,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
      id: json["id"],
      title: json["title"],
      clsconfirmed: json["clsconfirmed"],
      clsdeaths: json["clsdeaths"],
      clslevel: json["clslevel"],
      donevaccine: json["donevaccine"],
      onevaccine: json["onevaccine"],
      recovered: json["recovered"],
      incdeath: json["incdeath"],
      incconfirmed: json["incconfirmed"],
      level: json["level"],
      onevaccinepercent: json["onevaccinepercent"],
      donevaccinepercent: json["donevaccinepercent"],
      deaths: json["deaths"]);
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
