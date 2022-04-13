import 'package:equatable/equatable.dart';

abstract class NewsEvent extends Equatable{
  const NewsEvent();
}

class LoadEvent extends NewsEvent{

  const LoadEvent();

  @override
  List<Object?> get props => throw UnimplementedError();
}

class RefreshEvent extends NewsEvent{
  const RefreshEvent();

  @override
  List<Object?> get props => throw UnimplementedError();

}