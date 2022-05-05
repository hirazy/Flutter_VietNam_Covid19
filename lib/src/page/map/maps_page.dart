import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_vietnam_covid19/src/bloc/map/map_bloc.dart';
import 'package:flutter_vietnam_covid19/src/bloc/map/map_event.dart';
import 'package:flutter_vietnam_covid19/src/bloc/map/map_state.dart';
import 'package:flutter_vietnam_covid19/src/constant/theme.dart';
import 'package:flutter_vietnam_covid19/src/widget/maps/loading_widget.dart';
import 'package:syncfusion_flutter_maps/maps.dart';

class MapsPage extends StatefulWidget {
  static const String routeName = "/maps";

  @override
  MapsPageState createState() {
    return MapsPageState();
  }
}

class MapsPageState extends State<MapsPage> {
  late final GlobalKey _globalKey;

  @override
  void initState() {
    super.initState();

    _globalKey = GlobalKey();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MapBloc()..add(LoadEvent()),
      child: BlocBuilder<MapBloc, MapState>(
        builder: (context, state) {
          final bloc = BlocProvider.of<MapBloc>(context);

          Widget _title() {
            return InkWell(
              onTap: () {
                bloc.add(WarningMapEvent(context));
              },
              child: Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.only(left: 8, right: 8, bottom: 8),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Bản đồ vùng dịch",
                      style: Theme.of(context).textTheme.headline5!.copyWith(
                          overflow: TextOverflow.ellipsis, color: Colors.black),
                    ),
                    const Icon(
                      Icons.warning,
                      color: Colors.red,
                    )
                  ],
                ),
              ),
            );
          }

          Widget viewMap() {
            return SfMaps(layers: [
              MapShapeLayer(
                source: bloc.mapSource,
                legend: const MapLegend(
                  MapElement.shape,
                  position: MapLegendPosition.left,
                  offset: const Offset(-10, 0),
                  iconType: MapIconType.rectangle,
                  iconSize: const Size(14, 14),
                  enableToggleInteraction: true,
                ),
                loadingBuilder: (BuildContext context) {
                  return SizedBox(
                    height: 25,
                    width: 25,
                    child: SpinKitFadingFour(
                      color: ThemePrimary.primaryColor,
                      size: 14,
                    ),
                  );
                },
                strokeColor: Colors.white,
              )
            ]);
          }

          return Scaffold(
              key: _globalKey,
              body: state is LoadingState
                  ? LoadingWidget()
                  : RefreshIndicator(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _title(),
                          if (state is LoadingSuccess)
                            Expanded(
                              child: Container(
                                child: viewMap(),
                              ),
                            )
                        ],
                      ),
                      onRefresh: () async {
                        bloc.add(LoadEvent());
                      }));
        },
      ),
    );
  }

  Widget _map() {
    return Container(
      child: Text(""),
    );
  }
}
