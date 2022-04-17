import 'package:dio/dio.dart';

class AppDio with DioMixin implements Dio {

  static Dio getInstance() => AppDio();
}