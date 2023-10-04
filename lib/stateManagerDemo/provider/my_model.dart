
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:io';

class MyModel {
  int count = 0;
  int valueThatNeverChanges = 10;

  MyModel({this.count = 1});

  void changeCount() {
    count++;
    valueThatNeverChanges++;
    print(count);
  }
}

class MyModel2 with ChangeNotifier{
  int count = 0;
  int valueThatNeverChanges = 10;

  MyModel2({this.count = 1});

  void changeCount() {
    count++;
    valueThatNeverChanges++;
    print(count);
    notifyListeners();
  }

  //ChangeNotifyProvider会调用这个方法来释放资源，如果是用ListenableProvider则不会
  @override
  void dispose() {
    //释放资源
    super.dispose();
  }
}

///ChangeNotifier实现了Listenable，相当于我们不用ChangeNotifier，就要自己管理listener。
class MyModel3 implements Listenable{

  @override
  void addListener(VoidCallback listener) {
  }

  @override
  void removeListener(VoidCallback listener) {
  }

}

class MyModel4{

  int count = 0;

  MyModel4({this.count = 1});

  Future<void> changeCount() async{
    await Future.delayed(Duration(milliseconds: 2000));
    count++;
    print(count);
  }
}

class MyModel4Future{
  Future<MyModel4> asyncGetMyModel4() async{
    await Future.delayed(Duration(milliseconds: 2000));
    return MyModel4(count: 100);
  }
}

class MyModel5{

  int count = 0;
  StreamController<int>? _streamController;

  MyModel5(){
    _streamController = StreamController();
  }

  //获取流
  Stream<int> getStream()=>_streamController!.stream;

  //返回一个stream
  void changeCount(){
    print(count++);
    //通过sink发射事件
    _streamController?.sink.add(count);
    //return Stream<int>.periodic(interval, (int _count) => count++);
  }
}
