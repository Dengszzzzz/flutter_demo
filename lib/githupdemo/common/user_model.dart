
import 'package:flutter_demo/githupdemo/common/profile_change_notifier.dart';
import 'package:flutter_demo/models/user.dart';

//用户状态在登录状态发生改变时更新、通知其依赖项
class UserModel extends ProfileChangeNotifier{

  User? get user => profile.user;

  //App是否登录
  bool get isLogin => user!=null;

  //用户信息发生改变，更新用户信息并通知依赖它的子孙Widgets更新
  set user(User? user){
    if(user?.login != profile.user?.login){
      profile.lastLogin = profile.user?.login;
      profile.user = user;
      notifyListeners();
    }
  }
}