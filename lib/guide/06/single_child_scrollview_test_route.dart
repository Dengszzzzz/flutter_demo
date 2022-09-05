import 'package:flutter/material.dart';

///SingeChildScrollView 类似于 Android中的ScrollView，它只能接收一个子组件。
///它不支持基于 Sliver 的延迟加载模型。
class SingleChildScrollViewTestRoute extends StatelessWidget {
  const SingleChildScrollViewTestRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String str = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    return Scaffold(
      appBar: AppBar(title: Text("SingleChildScrollView"),),
      body:Scrollbar(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Center(
              child: Column(
                //动态创建一个List<Widget>
                children: str
                    .split("")
                    .map((e) => Text(
                  e,
                  textScaleFactor: 2.0,
                ))
                    .toList(),
              ),
            ),
          )),
    );
  }
}
