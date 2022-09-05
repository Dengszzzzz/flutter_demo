import 'package:flutter/material.dart';

///在实战中，凡是UI会依赖多个异步数据而发生变化的场景都可以使用StreamBuilder
/// 它常用于会多次读取数据的异步任务场景，如网络内容下载、文件读写等。
class StreamBuilderTestRoute extends StatefulWidget {
  const StreamBuilderTestRoute({Key? key}) : super(key: key);

  @override
  State<StreamBuilderTestRoute> createState() => _StreamBuilderTestRouteState();
}

class _StreamBuilderTestRouteState extends State<StreamBuilderTestRoute> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: Text("07.功能型组件"),
    ),
    body: Center(
      child: StreamBuilder<int>(
        stream: counter(),
        builder: (BuildContext context, AsyncSnapshot<int> snapshot){
          if(snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          }
          switch(snapshot.connectionState){
            case ConnectionState.none:
              return const Text('没有stream');
            case ConnectionState.waiting:
              return const Text('等待数据...');
            case ConnectionState.active:  //Stream处于激活状态（流上已有数据传递了）这个状态，FutureBuilder没有该状态
              return Text('active: ${snapshot.data}');
            case ConnectionState.done:
              return const Text('Stream 已关闭');
          }
        },
      ),
    ));
  }
}

Stream<int> counter(){
  return Stream.periodic(const Duration(seconds: 1),(i){
    return i;
  });
}


