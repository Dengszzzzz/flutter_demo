


import 'dart:io';

void main(){
 /* Future f = Future.delayed(const Duration(seconds: 3));
  //future的执行结果 通过 then 可获取
  f.then((value){
     print(value);
  });*/
  new File(r"G:\flutter_project\flutter_demo\11.txt").readAsString().then((String s) {
    //返回void 或 Future
    print(s);
  }).catchError((e) {
    //方式2，使用catchError
    print(e);
  });

  //Future.delayed(Duration(seconds: 10));
}