import 'package:flutter/cupertino.dart';

extension GetOrientation on BuildContext{
  Orientation get orientation => MediaQuery.of(this).orientation;
}