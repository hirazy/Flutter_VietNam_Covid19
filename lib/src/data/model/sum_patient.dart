import 'dart:convert';

SumPatient sumPatientFromJson(Map<String, dynamic> json) =>
  SumPatient.fromJson(json);

String sumPatientToJson(SumPatient data) => json.encode(data);

class SumPatient {
  bool success;
  Data data;

  SumPatient({required this.success, required this.data});

  factory SumPatient.fromJson(Map<String, dynamic> json) =>
      SumPatient(success: json["success"], data: Data.fromJson(json["data"]));
}

class Data {
  int id;
  DateTime issueDate;
  int confirmed;
  int recovered;
  int death;
  DateTime createdDate;
  dynamic modifiedDate;
  int plusConfirmed;
  int plusRecovered;
  int plusDeath;

  Data({
    required this.id,
    required this.issueDate,
    required this.confirmed,
    required this.recovered,
    required this.death,
    required this.createdDate,
    required this.modifiedDate,
    required this.plusConfirmed,
    required this.plusRecovered,
    required this.plusDeath,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
      id: json["id"],
      issueDate: json["issueDate"],
      confirmed: json["confirmed"],
      recovered: json["recovered"],
      death: json["createdData"],
      modifiedDate: json["modifiedDate"],
      plusConfirmed: json["plusConfirmed"],
      plusRecovered: json["plusRecovered"],
      plusDeath: json["plusDeath"],
      createdDate: json["createDate"]);
}
