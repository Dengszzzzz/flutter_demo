
import 'package:flutter/services.dart';

/// 封装flutter 调用 native的方法
class MyFlutterPlugin{
  
  static const MethodChannel _channel = MethodChannel("dzh/my_flutter_plugin");

  static Future<String?> get platformVersion async{
     String? version = await _channel.invokeMethod("getPlatformVersion");
     return version;
  }
}