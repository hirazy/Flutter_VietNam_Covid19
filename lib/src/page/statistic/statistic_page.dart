import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_vietnam_covid19/src/bloc/statistics/statistics_bloc.dart';
import 'package:flutter_vietnam_covid19/src/bloc/statistics/statistic_event.dart';
import 'package:flutter_vietnam_covid19/src/bloc/statistics/statistics_state.dart';

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

          return BlocListener<StatisticBloc, StatisticsState>(
            listener: (context, state) {
              if (state is LoadingState) {
                context.read<StatisticBloc>().add(const LoadEvent());
              }
            },
            child: Container(),
          );
        },
      ),
    );
  }
}
