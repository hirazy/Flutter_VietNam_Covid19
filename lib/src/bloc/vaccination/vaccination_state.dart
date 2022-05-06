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

class SearchSuccessState extends VaccinationState{

  const SearchSuccessState();

  @override
  List<Object?> get props => [];
}