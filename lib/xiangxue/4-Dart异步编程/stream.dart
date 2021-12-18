
//知识点：
//1.Steam ，异步监听。 listen()监听、onData()修改、onDone()完成等。
//2.只能单订阅，多订阅用它的广播。

import 'dart:io';

void main(){

 /* new File(r"G:\flutter_project\flutter_demo\11.txt").readAsBytes().then((_){
    print("future");
  });*/

  //写这个文件
  var dst = new File(r"G:\flutter_project\flutter_demo\11_副本.txt");
  var write = dst.openWrite();
  Stream<List<int>> stream = new File(r"G:\flutter_project\flutter_demo\11.txt").openRead();
  var listen = stream.listen((s){
    print("stream");
    write.add(s);
  });

  //替代掉listen的方法
//  listen.onData((s){
//    print("strema2");
//  });
//  listen.onDone((){
//    print("读完整个文件");
//  });
//  listen.pause();
//  listen.resume();


}
