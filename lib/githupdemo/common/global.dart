import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_demo/githupdemo/common/http/cache_object.dart';
import 'package:flutter_demo/githupdemo/common/http/git.dart';
import 'package:flutter_demo/models/index.dart';
import 'package:shared_preferences/shared_preferences.dart';

///管理App的全局变量

//可选主题色
const _themes = [
  Colors.blue,
  Colors.cyan,
  Colors.teal,
  Colors.green,
  Colors.red,
];

///有点类似于Application
class Global{
  static late SharedPreferences _pref;
  static Profile profile = Profile();
  //网络缓存对象
  static NetCache netCache = NetCache();

  //可选的主题列表
  /// 返回值类型 get 方法名 { 方法体 }
  static List<MaterialColor> get themes => _themes;

  //是否为release版
  static bool get isRelease => bool.fromEnvironment("dart.vm.product");

  ///初始化全局信息，会在App启动时执行
  static Future init() async{
    //FixMe：这是个啥？
    //WidgetFlutterBinding用于与 Flutter 引擎进行交互。某些插件需要使用平台通道来调用本机代码，
    // 这是异步完成的，因此您必须调用ensureInitialized()以确保您拥有WidgetsBinding.
    WidgetsFlutterBinding.ensureInitialized();
    _pref = await SharedPreferences.getInstance();
    var _profile = _pref.getString("profile");
    if(_profile!=null){
      try {
        profile = Profile.fromJson(jsonDecode(_profile));
      }catch(e){
        print(e);
      }
    }else{
      //默认主题索引为0，代表蓝色
      profile = Profile()..theme = 0;
    }

    //如果没有缓存策略，设置默认缓存策略
    profile.cache = profile.cache ?? CacheConfig()
    ..enable = true
    ..maxAge = 3600
    ..maxCount = 100;

    //初始化网络请求相关配置
    Git.init();
  }


  //持久化Profile信息
  static saveProfile(){
    _pref.setString("profile", jsonEncode(profile.toJson()));
  }

}