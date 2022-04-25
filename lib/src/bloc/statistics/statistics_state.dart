import 'package:equatable/equatable.dart';

class StatisticsState extends Equatable{
  const StatisticsState();

  @override
  List<Object?> get props => [];
}

class LoadingState extends StatisticsState{
  const LoadingState();

}

class LoadingSuccessState extends StatisticsState{

  const LoadingSuccessState();
}

class OnLoadingChartState extends StatisticsState{

  const OnLoadingChartState();
}