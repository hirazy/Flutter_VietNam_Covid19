import 'package:flutter/services.dart';

class CallNativeUtils {
  static var _CHANNEL;
  static late MethodChannel _platform;

  static void setChannel(channel) {
    _CHANNEL = channel;
  }

  static Future invokeMethod(
      {required String method, dynamic arguments}) async {
    return _platform.invokeMethod(method, arguments);
  }
}
