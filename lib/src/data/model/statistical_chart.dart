import 'dart:convert';

StatisticalChart statisticalChart(String str) =>
    StatisticalChart.fromJson(json.decode(str));

String statisticalChartToJson(StatisticalChart data) =>
    json.encode(data.toJson());

class StatisticalChart {
  bool success;

  List<StatisticalChartItem> list;

  StatisticalChart({required this.success, required this.list});

  factory StatisticalChart.fromJson(Map<String, dynamic> json) =>
      StatisticalChart(
          success: json["success"],
          list: List<StatisticalChartItem>.from(
              json["list"].forEach((it) => StatisticalChartItem.fromJson(it))));

  Map<String, dynamic> toJson() => {"success": this.success, "list": this.list};
}

class StatisticalChartItem {
  DateTime issueDate;
  String date;
  int confirmed;
  int recovered;
  int death;

  StatisticalChartItem(
      {required this.issueDate,
      required this.date,
      required this.confirmed,
      required this.recovered,
      required this.death});

  factory StatisticalChartItem.fromJson(Map<String, dynamic> json) =>
      StatisticalChartItem(
          issueDate: json["issueDate"],
          date: json["date"],
          confirmed: json["confirmed"] ?? 0,
          recovered: json["recovered"] ?? 0,
          death: json["death"] ?? 0);
}
