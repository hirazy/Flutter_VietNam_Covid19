import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VaccinationPage extends StatefulWidget{

  static const String routeName = '/vaccinvation';

  @override
  VaccinationState createState() {
    return VaccinationState();
  }
}

class VaccinationState extends State<VaccinationPage> with TickerProviderStateMixin{

  late GlobalKey _vaccinGlobalKey;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _vaccinGlobalKey = GlobalKey();
  }

  @override
  Widget build(BuildContext context) {
    // return BlocProvider(create: (context) => Vacci,
    // child: ,
    // );
    return Container(

    );
  }

  Widget _floatingFilterButton(){
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.green)
      ),
      child: Container(
        child: Center(
          child: Icon(
            Icons.filter_alt_rounded
          ),
        ),
      ),
      onPressed: (){

      },
    );
  }

}