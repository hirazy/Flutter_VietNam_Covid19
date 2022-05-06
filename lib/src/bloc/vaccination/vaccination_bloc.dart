import 'package:bloc/bloc.dart';
import 'package:flutter_vietnam_covid19/src/bloc/vaccination/vaccination_event.dart';
import 'package:flutter_vietnam_covid19/src/bloc/vaccination/vaccination_state.dart';

import '../../data/model/province_model.dart';

class VaccinationBloc extends Bloc<VaccinationEvent, VaccinationState> {

  List<Province> lstProvince = [];
  List<Province> lstSearchProvince = [];

  VaccinationBloc() : super(LoadingState()) {

  }

}