

//Stream(流) 在 Dart API 中也经常出现，表示发出的一系列的异步数据。Stream 是一个异步数据源，它是 Dart 中处理异步事件流的统一 API。
//Future 表示稍后获得的一个数据，所有异步的操作的返回值都用 Future 来表示。但是 Future 只能表示一次异步获得的数据。
// 而 Stream 表示多次异步获得的数据。
// 比如 IO 处理的时候，每次只会读取一部分数据和一次性读取整个文件的内容相比，Stream 的好处是处理过程中内存占用较小。
// 而 File 的 `readAsString()`是一次性读取整个文件的内容进来，虽然获得完整内容处理起来比较方便，但是如果文件很大的话就会导致内存占用过大的问题。

import 'dart:io';

void main(){
  Stream<List<int>> stream = new File(r"G:\flutter_project\flutter_demo\11.txt").openRead();
  //两个订阅者会报错
//  var listen = stream.listen((s){
//
//  });

//  stream.listen((s){
//
//  });


  //广播模式  : 可以多订阅
  var broadcastStream = stream.asBroadcastStream();
  broadcastStream.listen((_){
    print("listen1");

  });
  broadcastStream.listen((_){
    print("listen2");
  });
//
//  broadcastStream.listen((_){});
//  broadcastStream.listen((_){});
//  broadcastStream.listen((_){});
}
