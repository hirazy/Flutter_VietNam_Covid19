import 'package:equatable/equatable.dart';

class VaccinationState extends Equatable{

  const VaccinationState();

  @override
  List<Object?> get props => [];
}

class LoadingState extends VaccinationState{
  const LoadingState();

  @override
  List<Object?> get props => [];
}

class ChangeVaccineViewState extends VaccinationState{
  final bool isShowVaccination;

  const ChangeVaccineViewState({required this.isShowVaccination});

  @override
  List<Object> get props => [isShowVaccination];
}

class SearchSuccessState extends VaccinationState{

  final String keySearch;

  const SearchSuccessState({required this.keySearch});

  @override
  List<Object> get props => [keySearch];
}

class LoadingSuccessState extends VaccinationState{
  const LoadingSuccessState();
}