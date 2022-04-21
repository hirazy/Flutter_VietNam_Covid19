import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_vietnam_covid19/src/bloc/map/map_bloc.dart';
import 'package:flutter_vietnam_covid19/src/bloc/map/map_event.dart';
import 'package:flutter_vietnam_covid19/src/bloc/map/map_state.dart';
import 'package:flutter_vietnam_covid19/src/widget/maps/loading_widget.dart';

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
    return BlocProvider(create: (context) =>
    MapBloc()
      ..add(LoadEvent()),
      child: BlocBuilder<MapBloc, MapState>(
        builder: (context, state) {
          final bloc = BlocProvider.of<MapBloc>(context);

          return Scaffold(
              key: _globalKey,
              body: state is LoadingState ? RefreshIndicator(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                ],
              ),
              onRefresh: () async{
                bloc.add(LoadEvent());
              }):
              LoadingWidget()
          );
        },
      ),
    );
  }


  Widget _map() {
    return Container(
      child: Text(
          ""
      ),
    );
  }


}