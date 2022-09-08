
import 'package:flutter/material.dart';
import 'package:flutter_demo/models/index.dart';

import 'global.dart';

///使用Provider包来实现跨组件状态共享，因此我们需要定义相关的Provider
///在本实例中，需要共享的状态有登录用户信息、APP主题信息、APP语言信息。由于这些信息改变后
///都要立即通知其他依赖的该信息的Widget更新，所以我们应该使用ChangeNotifierProvider，
///另外，这些信息改变后都是需要更新Profile信息并进行持久化的。
///综上所述，我们可以定义一个ProfileChangeNotifier基类，然后让需要共享的Model继承自该类即可，ProfileChangeNotifier定义如下：
class ProfileChangeNotifier extends ChangeNotifier{

  //继承此类的，直接从这里取Profile，无需再从Global里取
  Profile get profile => Global.profile;

  @override
  void notifyListeners() {
    Global.saveProfile();  //保存Profile变更
    super.notifyListeners();  //通知依赖的Widget更新
  }

}