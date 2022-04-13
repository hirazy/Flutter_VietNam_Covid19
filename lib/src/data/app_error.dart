import 'dart:io';

import 'package:dio/dio.dart';

enum AppErrorType{
  network,
  badRequest,
  unauthorized,
  cancel,
  timeout,
  server,
  unknown
}

class AppError {
  late String message;
  late AppErrorType errorType;

  AppError(Exception? error){
    if(error is DioError){
      message = error.message;

      switch(error.type){
        case DioErrorType.other:
          if(error.error is SocketException){
            errorType = AppErrorType.network;
          }
          else{
            errorType = AppErrorType.unknown;
          }
          break;

        case DioErrorType.connectTimeout:
        case DioErrorType.receiveTimeout:
          errorType = AppErrorType.timeout;
          break;

        case DioErrorType.sendTimeout:
          errorType = AppErrorType.network;
          break;

        case DioErrorType.response:
          switch(error.response?.statusCode){
            case HttpStatus.BAD_REQUEST: // 400
              errorType = AppErrorType.badRequest;
              break;

            case HttpStatus.unauthorized:
              errorType = AppErrorType.unauthorized;
              break;

            case HttpStatus.internalServerError:
            case HttpStatus.badGateway:
            case HttpStatus.serviceUnavailable:
            case HttpStatus.gatewayTimeout:
              errorType = AppErrorType.server;
              break;
          }
          break;

        case DioErrorType.cancel:
          errorType = AppErrorType.cancel;
          break;

        default:
          errorType = AppErrorType.unknown;
      }
    }
    else{
      errorType = AppErrorType.unknown;
      message = 'AppError: $error';
    }
  }

}