import 'package:dio/dio.dart';
import 'package:flutter_vietnam_covid19/src/constant/constants.dart';

// final dioProvider = Provider((_) => AppDio._());
//
// class AppDio with DioMixin implements Dio {
//
//   AppDio._([BaseOptions? options]) {
//     options = BaseOptions(
//         baseUrl: Constants.baseUrl,
//         contentType: 'application/json',
//         connectTimeout: 30000,
//         sendTimeout: 30000,
//         receiveTimeout: 30000);
//
//     this.options = options;
//
//     interceptors.add(InterceptorsWrapper(
//       onRequest: (options, handler) async{
//         options.headers.addAll(await userAgentClientHintsHeader());
//
//         handler.next(options);
//       }
//     ));
//
//     interceptors.add(DioFirebasePerformanceInterceptor());
//
//     httpClientAdapter = DefaultHttpClientAdapter();
//   }
//
//   static Dio getInstance() => AppDio._();
// }
