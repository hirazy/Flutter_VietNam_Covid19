import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_vietnam_covid19/src/bloc/vaccination/vaccination_bloc.dart';
import 'package:flutter_vietnam_covid19/src/bloc/vaccination/vaccination_event.dart';
import 'package:flutter_vietnam_covid19/src/bloc/vaccination/vaccination_state.dart';
import 'package:flutter_vietnam_covid19/src/constant/theme.dart';
import 'package:intl/intl.dart';

import '../../widget/vaccination/floating_animation.dart';

class VaccinationPage extends StatefulWidget {
  static const String routeName = '/vaccination';

  @override
  VaccinationPageState createState() {
    return VaccinationPageState();
  }
}

class VaccinationPageState extends State<VaccinationPage>
    with TickerProviderStateMixin {
  late GlobalKey _vaccineGlobalKey;
  late TextEditingController _searchEditController;
  late AnimationController animationController;
  late Animation<double> animation;

  @override
  void initState() {
    _vaccineGlobalKey = GlobalKey();

    _searchEditController = TextEditingController();

    _searchEditController.addListener(() {
      BlocProvider.of<VaccinationBloc>(_vaccineGlobalKey.currentContext!)
          .add(SearchProvinceEvent(keySearch: _searchEditController.text));
    });

    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 250),
    );

    CurvedAnimation curvedAnimation =
        CurvedAnimation(curve: Curves.easeInOut, parent: animationController);
    animation = Tween<double>(begin: 0, end: 1).animate(curvedAnimation);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => VaccinationBloc()..add(const LoadEvent()),
      child: BlocBuilder<VaccinationBloc, VaccinationState>(
        builder: (context, state) {
          final bloc = BlocProvider.of<VaccinationBloc>(context);

          Widget header() {
            return InkWell(
              onTap: () {
                bloc.add(ChangeVaccineViewEvent(
                    isShowVaccine: !bloc.isShowVaccination));
              },
              child: Container(
                color: ThemePrimary.primaryColor,
                padding: const EdgeInsets.only(left: 8, right: 8, bottom: 8),
                child: Row(
                  children: [
                    Expanded(
                        child: Text(
                      bloc.isShowVaccination
                          ? "Số liệu tiêm chủng"
                          : "Số liệu ca nhiễm",
                      style: Theme.of(context).textTheme.headline6!.copyWith(
                          overflow: TextOverflow.ellipsis, color: Colors.white),
                    ))
                  ],
                ),
              ),
            );
          }

          Widget _body() {
            Widget _loadingWidget() {
              return SpinKitFadingFour(
                color: ThemePrimary.primaryColor,
                size: 14,
              );
            }

            Widget _searchWidget() {
              return Container(
                  margin: EdgeInsets.all(8),
                  child: SizedBox(
                    height: 58,
                    child: TextField(
                      controller: _searchEditController,
                      style: Theme.of(context).textTheme.bodyText2,
                      decoration: InputDecoration(
                          isDense: true,
                          hintText: "Tìm kiếm theo tỉnh thành",
                          prefixIcon: Icon(
                            Icons.search,
                            color: ThemePrimary.primaryColor,
                          ),
                          suffixIcon: _searchEditController.text.isNotEmpty
                              ? IconButton(
                                  onPressed: () {
                                    _searchEditController.clear();
                                  },
                                  icon: const Icon(
                                    Icons.clear,
                                    color: Colors.grey,
                                  ),
                                )
                              : null,
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide: BorderSide(
                                width: 1, color: ThemePrimary.primaryColor),
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              borderSide: BorderSide(
                                  width: 1, color: ThemePrimary.primaryColor)),
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              borderSide: BorderSide(
                                  width: 1, color: ThemePrimary.primaryColor))),
                    ),
                  ));
            }

            Widget _titleListWidget() {
              return Container(
                margin: EdgeInsets.only(left: 10),
                child: Row(
                  children: [
                    Expanded(
                        flex: 1,
                        child: Text(
                          "Tỉnh thành",
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(color: Colors.black),
                        )),
                    const SizedBox(
                      width: 8,
                    ),
                    Expanded(
                        flex: 1,
                        child: Text(
                          bloc.isShowVaccination ? "Tiêm mũi 1" : "Tổng số ca",
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(color: Colors.black),
                        )),
                    const SizedBox(
                      width: 8,
                    ),
                    Expanded(
                        flex: 1,
                        child: Text(
                          "Số ca mới",
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(color: Colors.black),
                        ))
                  ],
                ),
              );
            }

            Widget _lstData() {
              Widget _item(
                  {required int sumVaccine, required double percentVaccine}) {
                int _percentVaccine = percentVaccine.toInt();
                int _restpercent = 100 - _percentVaccine;

                Widget _ratioPercent() {
                  return Container(
                    child: Row(
                      children: [
                        Expanded(
                          flex: _percentVaccine,
                          child: Container(
                            child: Center(
                              child: Text(
                                (percentVaccine < 100
                                        ? percentVaccine.toStringAsFixed(2)
                                        : "100") +
                                    "%",
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle1!
                                    .copyWith(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: _restpercent,
                          child: Container(
                            color: ThemePrimary.orange,
                          ),
                        ),
                      ],
                    ),
                  );
                }

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      NumberFormat.decimalPattern().format(sumVaccine),
                      style: Theme.of(context)
                          .textTheme
                          .bodyText2!
                          .copyWith(color: ThemePrimary.primaryColor),
                    ),
                    _ratioPercent()
                  ],
                );
              }

              Widget _newCaseItem(incconfirmed) {
                return Container(
                  child: Row(
                    children: [
                      Icon(Icons.arrow_upward,
                          color: incconfirmed > 0
                              ? ThemePrimary.red
                              : Colors.transparent,
                          size: 16),
                      Text(
                        incconfirmed > 0
                            ? NumberFormat.decimalPattern().format(incconfirmed)
                            : "-",
                        style: Theme.of(context)
                            .textTheme
                            .bodyText2!
                            .copyWith(color: ThemePrimary.red),
                      )
                    ],
                  ),
                );
              }

              return Expanded(
                  child: bloc.lstSearchProvince.isEmpty
                      ? const Center(
                          child: Text("Không có dữ liệu"),
                        )
                      : ListView(
                          physics: const AlwaysScrollableScrollPhysics(),
                          children: bloc.lstSearchProvince
                              .map((e) => Container(
                                  padding: EdgeInsets.only(top: 10, bottom: 10),
                                  decoration: const BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                              width: 1,
                                              color: Colors.black12))),
                                  margin: EdgeInsets.only(left: 10),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        flex: 1,
                                        child: Text(
                                          e.title ?? "",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText2!
                                              .copyWith(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      SizedBox(width: 12),
                                      Expanded(
                                        flex: 1,
                                          child: bloc.isShowVaccination
                                              ? _item(
                                                  sumVaccine: e.donevaccine!,
                                                  percentVaccine:
                                                      e.donevaccinepercent!)
                                              : Text(
                                                  NumberFormat.decimalPattern()
                                                      .format(e.confirmed!),
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodyText2!
                                                      .copyWith(
                                                          color: Colors.black,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                )),
                                      SizedBox(width: 12),
                                      Expanded(
                                        flex: 1,
                                        child: bloc.isShowVaccination
                                            ? _item(
                                                sumVaccine: e.donevaccine!,
                                                percentVaccine:
                                                    e.donevaccinepercent!)
                                            : _newCaseItem(e.incconfirmed),
                                      )
                                    ],
                                  )))
                              .toList(),
                        ));
            }

            return Expanded(
                child: state is LoadingState
                    ? _loadingWidget()
                    : Column(
                        children: [
                          _searchWidget(),
                          _titleListWidget(),
                          _lstData(),
                        ],
                      ));
          }

          return Scaffold(
              key: _vaccineGlobalKey,
              body: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [header(), _body()],
                ),
              ),
              floatingActionButton: FloatingActionBubble(
                onPress: () {
                  print("onPress Floating Action Button");
                  if (animationController.status == AnimationStatus.dismissed) {
                    bloc.add(
                        const ReverseAnimationEvent(isReverseAnimation: false));
                    animationController.forward();
                  } else {
                    bloc.add(
                        const ReverseAnimationEvent(isReverseAnimation: true));
                    animationController.reverse();
                  }
                },
                iconData: bloc.isReverseAnimation
                    ? Icons.filter_alt_rounded
                    : Icons.close,
                items: [
                  Bubble(
                      icon: Icons.format_list_numbered_sharp,
                      iconColor: bloc.isShowVaccination
                          ? ThemePrimary.primaryColor
                          : Colors.white,
                      bubbleColor: bloc.isShowVaccination
                          ? Colors.white
                          : ThemePrimary.primaryColor,
                      onPress: () {
                        bloc.add(
                            const ChangeVaccineViewEvent(isShowVaccine: true));
                      },
                      title: "Xem theo số liệu tiêm chủng",
                      textStyle: Theme.of(context)
                          .textTheme
                          .bodyText1!
                          .copyWith(
                              fontWeight: FontWeight.bold,
                              color: bloc.isShowVaccination
                                  ? ThemePrimary.primaryColor
                                  : Colors.white)),
                  Bubble(
                      icon: Icons.format_list_numbered_sharp,
                      iconColor: bloc.isShowVaccination
                          ? Colors.white
                          : ThemePrimary.primaryColor,
                      bubbleColor: !bloc.isShowVaccination
                          ? Colors.white
                          : ThemePrimary.primaryColor,
                      onPress: () {
                        bloc.add(
                            const ChangeVaccineViewEvent(isShowVaccine: false));
                      },
                      title: "Xem theo số liệu ca nhiễm",
                      textStyle: Theme.of(context)
                          .textTheme
                          .bodyText1!
                          .copyWith(
                              fontWeight: FontWeight.bold,
                              color: !bloc.isShowVaccination
                                  ? ThemePrimary.primaryColor
                                  : Colors.white))
                ],
                animation: animation,
                backGroundColor: ThemePrimary.primaryColor,
                iconColor: Colors.white,
              ));
        },
      ),
    );
  }
}
