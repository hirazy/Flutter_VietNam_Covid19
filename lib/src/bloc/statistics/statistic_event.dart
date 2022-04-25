import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_vietnam_covid19/src/data/model/province_model.dart';

class StatisticEvent extends Equatable {
  const StatisticEvent();

  @override
  List<Object?> get props => [];
}

class LoadEvent extends StatisticEvent {
  const LoadEvent();
}

class RefreshEvent extends StatisticEvent {
  const RefreshEvent();
}

class ChangeProvinceEvent extends StatisticEvent {
  final Province lastProvince;
  final BuildContext context;

  ChangeProvinceEvent({required this.lastProvince, required this.context});

  @override
  List<Object?> get props => [lastProvince, context];
}
