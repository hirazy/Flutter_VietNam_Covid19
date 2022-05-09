import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_vietnam_covid19/src/bloc/statistics/statistics_bloc.dart';
import 'package:flutter_vietnam_covid19/src/bloc/statistics/statistic_event.dart';
import 'package:flutter_vietnam_covid19/src/bloc/statistics/statistics_state.dart';
import 'package:flutter_vietnam_covid19/src/constant/theme.dart';
import 'package:flutter_vietnam_covid19/src/data/model/chart_data.dart';
import 'package:flutter_vietnam_covid19/src/widget/maps/loading_widget.dart';
import 'package:flutter_vietnam_covid19/src/widget/statistics/statistic_item.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

enum CovidNumberType { infections, beingTreated, gotCured, dead }

class StatisticPage extends StatefulWidget {
  static const String routeName = "/statistics";

  @override
  StatisticPageState createState() {
    return StatisticPageState();
  }
}

class StatisticPageState extends State<StatisticPage> {
  late GlobalKey _statisticsGlobalKey;

  @override
  void initState() {
    super.initState();
    _statisticsGlobalKey = GlobalKey();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => StatisticBloc()..add(const LoadEvent()),
      child: BlocBuilder<StatisticBloc, StatisticsState>(
        builder: (context, state) {
          final bloc = BlocProvider.of<StatisticBloc>(context);

          Widget _statistics() {
            int _treatedValue = 0;
            if (bloc.sumPatient != null) {
              _treatedValue = (bloc.sumPatient!.data.confirmed ?? 0) -
                  (bloc.sumPatient!.data.recovered ?? 0) -
                  (bloc.sumPatient!.data.death ?? 0);
            }

            String lastUpdate = bloc.sumPatient != null
                ? DateFormat("dd/MM/yyyy")
                    .format(bloc.sumPatient!.data.createdDate)
                : "";

            return Container(
              padding: EdgeInsets.only(left: 8, right: 8, bottom: 8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Tổng số ca nhiễm trong nước",
                    style: Theme.of(context)
                        .textTheme
                        .headline6!
                        .copyWith(color: Colors.white),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    child: Row(
                      children: [
                        StatisticItem(
                            backgroundColor: Colors.red,
                            value: bloc.sumPatient?.data.confirmed ?? 0,
                            title: "Số ca nhiễm",
                            plusValue:
                                bloc.sumPatient?.data.plusConfirmed ?? 0),
                        const SizedBox(width: 5),
                        StatisticItem(
                          backgroundColor: Colors.blue,
                          value: _treatedValue,
                          title: "Đang điều trị",
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 5),
                    child: Row(
                      children: [
                        StatisticItem(
                            backgroundColor: Colors.green,
                            title: "Đã khỏi bệnh",
                            value: bloc.sumPatient?.data.recovered ?? 0,
                            plusValue:
                                bloc.sumPatient?.data.plusRecovered ?? 0),
                        const SizedBox(width: 5),
                        StatisticItem(
                          backgroundColor: Colors.yellow,
                          value: bloc.sumPatient?.data.death ?? 0,
                          plusValue: bloc.sumPatient?.data.plusDeath ?? 0,
                          title: "Tử vong",
                        ),
                      ],
                    ),
                  ),
                  Container(
                      padding: EdgeInsets.all(8),
                      child: Center(
                          child: Text(
                        "* Dữ liệu cập nhật ngày $lastUpdate",
                        style: Theme.of(context)
                            .textTheme
                            .subtitle2!
                            .copyWith(color: Colors.white),
                      ))),
                ],
              ),
            );
          }

          Widget _chart() {
            SfCartesianChart _buildDefaultChart() {
              List<ChartSeries<ChartData, dynamic>> getDefaultSeries() {
                return <ChartSeries<ChartData, dynamic>>[
                  // SplineAreaSeries(
                  //     dataSource: bloc.lstChartData ?? [],
                  //     xValueMapper: (ChartData sales, _) => sales.x,
                  //     yValueMapper: (ChartData sales, _) => sales.y,
                  //     opacity: 0.7,
                  //     name: 'Ca nhiễm',
                  //     borderColor: ThemePrimary.red,
                  //     onCreateRenderer:
                  //         (ChartSeries<ChartData, dynamic> series) {
                  //       return CustomSplineAreaSeriesRenderer(series);
                  //     },
                  // ),
                  SplineAreaSeries<ChartData, dynamic>(
                    onCreateRenderer: (ChartSeries<ChartData, dynamic> series) {
                      return CustomSplineAreaSeriesRenderer(series);
                    },
                    gradient: LinearGradient(colors: [
                      ThemePrimary.red,
                      ThemePrimary.red.withOpacity(0.2)
                    ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
                    dataSource: bloc.lstChartData ?? [],
                    opacity: 0.7,
                    borderColor: ThemePrimary.red,
                    borderDrawMode: BorderDrawMode.top,
                    name: 'Ca nhiễm',
                    xValueMapper: (ChartData sales, _) => sales.x,
                    yValueMapper: (ChartData sales, _) => sales.y,
                  ),
                  SplineAreaSeries<ChartData, dynamic>(
                    onCreateRenderer: (ChartSeries<ChartData, dynamic> series) {
                      return CustomSplineAreaSeriesRenderer(series);
                    },
                    gradient: LinearGradient(colors: [
                      ThemePrimary.orange,
                      ThemePrimary.orange.withOpacity(0.2)
                    ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
                    // borderWidth: 2,
                    opacity: 0.7,
                    borderColor: ThemePrimary.orange,
                    borderDrawMode: BorderDrawMode.top,
                    dataSource: bloc.lstChartData ?? [],
                    name: 'Tử vong',
                    xValueMapper: (ChartData sales, _) => sales.x,
                    yValueMapper: (ChartData sales, _) =>
                        sales.secondSeriesYValue,
                  )
                ];
              }

              return SfCartesianChart(
                legend: Legend(
                    isVisible: true,
                    overflowMode: LegendItemOverflowMode.wrap,
                    legendItemBuilder: (String name, dynamic series,
                        dynamic point, int index) {
                      return SizedBox(
                        height: 24,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            index != 0
                                ? Icon(Icons.circle,
                                    size: 16.0, color: ThemePrimary.orange)
                                : Icon(Icons.circle,
                                    size: 14.0, color: ThemePrimary.red),
                            const SizedBox(width: 4.0),
                            Text(series.name,
                                style: Theme.of(context).textTheme.subtitle2!),
                            const SizedBox(width: 4.0),
                          ],
                        ),
                      );
                    },
                    orientation: LegendItemOrientation.horizontal,
                    alignment: ChartAlignment.near,
                    position: LegendPosition.top),
                plotAreaBorderWidth: 0,
                primaryXAxis: CategoryAxis(
                  borderColor: Colors.white,
                  labelPlacement: LabelPlacement.onTicks,
                  majorGridLines: const MajorGridLines(width: 0),
                ),
                primaryYAxis: NumericAxis(
                  labelFormat: '{value}',
                ),
                series: getDefaultSeries(),
                tooltipBehavior: TooltipBehavior(enable: true),
              );
            }

            return Expanded(
                child: Container(
              decoration: BoxDecoration(
                  color: ThemePrimary.scaffoldBackgroundColor,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(50),
                      topLeft: Radius.circular(50))),
              child: Column(
                children: [
                  SizedBox(
                    height: 15,
                  ),
                  Text("Biểu đồ số ca nhiễm và tử vong",
                      style: Theme.of(context).textTheme.headline6!.copyWith()),
                  InkWell(
                    onTap: () {
                      BlocProvider.of<StatisticBloc>(
                              _statisticsGlobalKey.currentContext!)
                          .add(ChangeProvinceEvent(
                              lastProvince: bloc.provinceSelected!,
                              context: context));
                    },
                    child: Container(
                      margin: EdgeInsets.only(top: 10),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            bloc.provinceSelected!.title ?? "",
                            style: Theme.of(context)
                            .textTheme.bodyText1!.copyWith(
                              fontWeight: FontWeight.w600,
                              color: Colors.black
                            ),
                          ),
                          Icon(
                            Icons.arrow_drop_down,
                            color: Colors.black,
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                      child: Padding(
                          padding: EdgeInsets.only(right: 12),
                          child: bloc.state is LoadingState
                              ? LoadingWidget()
                              : _buildDefaultChart()))
                ],
              ),
            ));
          }

          return Scaffold(
            backgroundColor: ThemePrimary.primaryColor,
            key: _statisticsGlobalKey,
            body: state is LoadingState
                ? LoadingWidget()
                : RefreshIndicator(
                    child: SingleChildScrollView(
                      physics: AlwaysScrollableScrollPhysics(),
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height -
                            kToolbarHeight -
                            kToolbarHeight -
                            MediaQuery.of(context).padding.top -
                            16,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [_statistics(), _chart()],
                        ),
                      ),
                    ),
                    onRefresh: () async {
                      bloc.add(const RefreshEvent());
                    }),
          );
        },
      ),
    );
  }
}
