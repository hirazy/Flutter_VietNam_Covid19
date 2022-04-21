import 'package:equatable/equatable.dart';

class MapState extends Equatable{
  const MapState();

  @override
  List<Object?> get props => [];

}

class LoadingState extends MapState{
  const LoadingState();
}

class LoadingListData extends MapState{
  const LoadingListData();
}

class SearchState extends MapState{

  const SearchState();

}

class ShowWarningState extends MapState{
  const ShowWarningState();
}

class LoadingSuccess extends MapState{

  const LoadingSuccess();
}