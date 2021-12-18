
import 'dart:async';
import 'dart:io';

//Stream有两种订阅模式：单订阅和多订阅。
// 单订阅就是只能有一个订阅者，上面的使用我们都是单订阅模式，而广播是可以有多个订阅者。
// 通过 Stream.asBroadcastStream() 可以将一个单订阅模式的 Stream 转换成一个多订阅模式的 Stream，isBroadcast 属性可以判断当前 Stream 所处的模式。

//2.
//stream通过asBroadcastStream转为了多订阅，但是本质是单订阅流，并不改变原始 stream 的实现特性。所以先发消息再订阅，也能收到消息。
//StreamController.broadcast()，先发消息再订阅，收不到该条消息。

void main(){
  var stream = Stream.fromIterable([1,2,3,4]);
  //由单订阅转换而来的  ： 和单订阅唯一的区别就是 允许多订阅
  var broadcastStream = stream.asBroadcastStream();

 /* broadcastStream.listen((i){
    print("订阅者1：${i}");
  });

  broadcastStream.listen((i){
    print("订阅者2：${i}");
  });*/


  //===========================
  //直接创建一个广播
  var streamController = StreamController.broadcast();
  //发送一条广播
  streamController.add("1");

  //不能获得数据
  streamController.stream.listen((i){
    print("广播:"+i);
  });
  streamController.close();
  //============================

  //可以获得数据
  broadcastStream.listen((i){
    print("转换的广播：$i");
  });

}
