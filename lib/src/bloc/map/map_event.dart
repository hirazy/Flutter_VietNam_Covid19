import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class MapEvent extends Equatable {
  const MapEvent();
}

class MapEventLoading extends MapEvent {
  const MapEventLoading();

  @override
  List<Object?> get props => [];
}

class MapEventRefresh extends MapEvent {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class MapEventLoaded extends MapEvent {
  const MapEventLoaded();

  @override
  List<Object?> get props => [];
}

class MapEventError extends MapEvent {
  final BuildContext context;

  const MapEventError({required this.context});

  @override
  List<Object?> get props => throw UnimplementedError();
}
