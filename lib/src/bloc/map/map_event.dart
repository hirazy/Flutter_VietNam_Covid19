import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class MapEvent extends Equatable {
  const MapEvent();
}

class LoadEvent extends MapEvent {
  const LoadEvent();

  @override
  List<Object?> get props => [];
}

class RefreshEvent extends MapEvent {
  @override
  List<Object?> get props => [];
}


class WarningMapEvent extends MapEvent {

  const WarningMapEvent();

  @override
  List<Object?> get props => [];
}
