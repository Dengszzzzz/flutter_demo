

import '单例.dart';

void main(){
  var manager = Singleton.getInstance();
  manager.i = 20;
  print(manager.i);
}