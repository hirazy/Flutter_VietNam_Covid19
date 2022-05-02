import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../constant/theme.dart';

class ChartData {
  final dynamic? x;

  final num? y;

  final dynamic? xValue;

  final num? yValue;

  final num? secondSeriesYValue;

  final num? thirdSeriesYValue;

  final Color? pointColor;

  final num? size;

  final String? text;

  final num? open;

  final num? close;

  final num? low;

  final num? high;

  final num? volume;

  ChartData(
      {this.x,
      this.y,
      this.xValue,
      this.yValue,
      this.secondSeriesYValue,
      this.thirdSeriesYValue,
      this.pointColor,
      this.size,
      this.text,
      this.open,
      this.close,
      this.low,
      this.high,
      this.volume});
}

class CustomSplineAreaSeriesRenderer extends SplineAreaSeriesRenderer {
  CustomSplineAreaSeriesRenderer(this.series);

  final ChartSeries<ChartData, dynamic> series;

  List<Color> markerColorList = <Color>[ThemePrimary.red, ThemePrimary.orange];

  @override
  void drawDataMarker(int index, Canvas canvas, Paint fillPaint,
      Paint strokePaint, double pointX, double pointY,
      [CartesianSeriesRenderer? seriesRenderer]) {
    strokePaint.color = Colors.white;
    fillPaint.color = markerColorList[index];
    super.drawDataMarker(
        index, canvas, fillPaint, strokePaint, pointX, pointY, seriesRenderer);
  }
}
