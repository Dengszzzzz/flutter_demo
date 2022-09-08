
import 'package:flutter/material.dart';
import 'package:flutter_demo/githupdemo/common/global.dart';
import 'package:flutter_demo/githupdemo/common/profile_change_notifier.dart';

//App语言
class LocalModel extends ProfileChangeNotifier{

  //获取当前用户的App语言配置Locale类，如果为null，则语言跟随系统语言
  Locale? getLocale(){
    if(profile.locale == null) return null;
    var t = profile.locale!.split("_");
    return Locale(t[0],t[1]);
  }

  //用户改变App语言后，通知依赖项更新
  void setLocale(String locale){
    if(locale != profile.locale){
      profile.locale = locale;
      notifyListeners();
    }
  }
}