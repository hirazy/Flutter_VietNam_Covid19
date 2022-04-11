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
      body: Container(
        child: Text(
          "Hehe"
        ),
      ),
    );
  }

}