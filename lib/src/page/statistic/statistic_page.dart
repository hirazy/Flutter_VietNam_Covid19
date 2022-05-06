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
                            .subtitle1!
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
                  SplineAreaSeries(
                      dataSource: bloc.lstChartData ?? [],
                      xValueMapper: (ChartData sales, _) => sales.x,
                      yValueMapper: (ChartData sales, _) => sales.y,
                      opacity: 0.7,
                      name: 'Ca nhiễm',
                      borderColor: ThemePrimary.red,
                      onCreateRenderer:
                          (ChartSeries<ChartData, dynamic> series) {
                        return CustomSplineAreaSeriesRenderer(series);
                      },
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
                  legendItemBuilder:
                      (String name, dynamic series, dynamic point, int index) {
                    return SizedBox(
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
                ),
                primaryXAxis: CategoryAxis(
                  borderColor: Colors.white,
                  labelPlacement: LabelPlacement.onTicks,
                  majorGridLines: const MajorGridLines(width: 0),
                ),
                primaryYAxis: NumericAxis(
                  labelFormat: '{value}',
                ),
                series: getDefaultSeries(),
              );
            }

            return Expanded(
                child: Container(
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(50))),
              child: Column(
                children: [
                  Text("Biểu đồ số ca nhiễm và tử vong",
                      style: Theme.of(context)
                          .textTheme
                          .headline5!
                          .copyWith(color: Colors.white)),
                  InkWell(
                    onTap: () {
                      BlocProvider.of<StatisticBloc>(
                              _statisticsGlobalKey.currentContext!)
                          .add(ChangeProvinceEvent(
                              lastProvince: bloc.provinceSelected!,
                              context: context));
                    },
                    child: Container(
                        child: Row(
                      children: [],
                    )),
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
                      bloc.add(RefreshEvent());
                    }),
          );

          // return BlocListener<StatisticBloc, StatisticsState>(
          //   listener: (context, state) {
          //     if (state is LoadingState) {
          //       context.read<StatisticBloc>().add(const LoadEvent());
          //     }
          //   },
          //   child: Container(
          //     child: Row(
          //       children: [
          //         // StatisticItem(
          //         //   backgroundColor: Colors.red,
          //         //   title: "",
          //         //   value: ,
          //         // ),
          //         // StatisticItem(),
          //         // StatisticItem(),
          //         StatisticItem(
          //           backgroundColor: Colors.red,
          //           value: 5,
          //           title: "Hello",
          //         ),
          //         StatisticItem(
          //           backgroundColor: Colors.blue,
          //           value: 5,
          //           title: "Hello",
          //         ),
          //         StatisticItem(
          //           backgroundColor: Colors.green,
          //           value: 5,
          //           title: "Hello",
          //         ),
          //         StatisticItem(
          //           backgroundColor: Colors.yellow,
          //           value: 5,
          //           title: "Hello",
          //         )
          //       ],
          //     ),
          //   ),
          // );
        },
      ),
    );
  }
}
