import 'package:bloc/bloc.dart';
import 'package:flutter_vietnam_covid19/src/bloc/vaccination/vaccination_event.dart';
import 'package:flutter_vietnam_covid19/src/bloc/vaccination/vaccination_state.dart';
import 'package:tiengviet/tiengviet.dart';

import '../../data/model/province_model.dart';
import '../../data/remote/api.dart';

class VaccinationBloc extends Bloc<VaccinationEvent, VaccinationState> {

  List<Province> lstProvince = [];
  List<Province> lstSearchProvince = [];
  bool isShowVaccination = false;
  bool isReverseAnimation = true;

  VaccinationBloc() : super(const VaccinationState()) {
    on<LoadEvent>(onLoadData);
    on<RefreshEvent>(onRefresh);
    on<SearchProvinceEvent>(onSearchProvince);
    on<ChangeVaccineViewEvent>(onChangeVaccineView);
  }

  void onLoadData(LoadEvent event, Emitter<VaccinationState> emitter) async{
    emitter(const LoadingState());
    lstProvince = await Api.getAllPatientProvinces();
    lstSearchProvince.addAll(lstProvince);
    emitter(const LoadingSuccessState());
  }

  void onRefresh(RefreshEvent event, Emitter<VaccinationState> emitter) async{
    emitter(const LoadingState());
    lstProvince = await Api.getAllPatientProvinces();
    lstSearchProvince.addAll(lstProvince);
    emitter(const LoadingSuccessState());
  }

  void onSearchProvince(SearchProvinceEvent event, Emitter<VaccinationState> emitter) async{
    emitter(const LoadingState());

    String _keySearch = TiengViet.parse(event.keySearch).toLowerCase();

    print("onSearchProvince " + _keySearch);

    lstSearchProvince.clear();
    if (_keySearch.isEmpty) {
      lstSearchProvince.addAll(lstProvince);
    } else {
      lstSearchProvince = lstProvince
          .where((element) => TiengViet.parse(element.title!)
          .toLowerCase()
          .contains(_keySearch))
          .toList();
    }

    emitter(SearchSuccessState(keySearch: _keySearch));
  }

  void onChangeVaccineView(ChangeVaccineViewEvent event, Emitter<VaccinationState> emitter){
    isShowVaccination = event.isShowVaccine;
    isReverseAnimation = false;
    emitter(ChangeVaccineViewState(isShowVaccination: isShowVaccination));
  }

  void onHandleAnimation(ReverseAnimationEvent event, Emitter<VaccinationState> emitter){

  }
}