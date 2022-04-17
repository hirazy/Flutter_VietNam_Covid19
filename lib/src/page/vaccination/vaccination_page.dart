import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class VaccinationPage extends StatefulWidget{

  static const String routeName = '/vaccinvation';

  @override
  VaccinationState createState() {
    return VaccinationState();
  }

}

class VaccinationState extends State<VaccinationPage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: _floatingFilterButton(),
      body: Container(

      ),
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