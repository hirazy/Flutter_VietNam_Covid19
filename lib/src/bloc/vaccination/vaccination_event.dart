import 'package:equatable/equatable.dart';

abstract class VaccinationEvent extends Equatable{
   const VaccinationEvent();
}

class LoadEvent extends VaccinationEvent{
   const LoadEvent();

  @override
  List<Object?> get props => [];
}

class RefreshEvent extends VaccinationEvent{
   const RefreshEvent();

   @override
   List<Object?> get props => [];
}

class SearchProvinceEvent extends VaccinationEvent{
   final String keySearch;

   const SearchProvinceEvent({ required this.keySearch});

   @override
   List<Object?> get props => [keySearch];
}

class ChangeVaccineViewEvent extends VaccinationEvent{
   final bool isShowVaccine;

   const ChangeVaccineViewEvent({ required this.isShowVaccine});

   @override
   List<Object?> get props => [isShowVaccine];
}

class ReverseAnimationEvent extends VaccinationEvent{

   final bool isReverseAnimation;

   const ReverseAnimationEvent({required this.isReverseAnimation});

   @override
   List<Object?> get props => [isReverseAnimation];
}