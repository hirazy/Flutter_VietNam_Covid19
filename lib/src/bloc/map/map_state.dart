import 'package:equatable/equatable.dart';

abstract class MapState extends Equatable{
  const MapState();

  @override
  List<Object?> get props => throw UnimplementedError();

}

class MapStateLoading extends MapState{

}

class SearchState extends MapState{

}

class ShowWarningState extends MapState{

}