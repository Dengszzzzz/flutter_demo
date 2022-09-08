
import 'package:flutter/material.dart';
import 'package:flutter_demo/githupdemo/common/global.dart';
import 'package:flutter_demo/githupdemo/common/profile_change_notifier.dart';

//主题状态在用户更换APP主题时更新、通知其依赖项
class ThemeModel  extends ProfileChangeNotifier{

  //获取当前主题，如果未设置主题，则默认使用蓝色
  MaterialColor get theme => Global.themes.firstWhere((element){
    //找到第一个profile.theme相等的元素
    return element.value == profile.theme;
  },orElse: (){
    //找不到默认蓝色
    return Colors.blue;
  });

  set theme(MaterialColor color){
    if(color != theme){
      profile.theme = color[500]!.value;
      notifyListeners();
    }
  }
}