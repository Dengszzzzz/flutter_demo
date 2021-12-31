import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MainRoute();
  }
}

class MainRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //Row 横向布局  Column 纵向布局
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(title: const Text("主页")),
          body: Column(
            children: <Widget>[
              const Text("第一个页面"),
              Builder(builder: (context) {
                return ElevatedButton(
                    onPressed: () {
                      //导航到新路由
                      ///方案一、在MaterialApp以下用Buidler包裹一层。
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                            debugPrint("----测试路由跳转");
                        return SecondRoute();
                      }));
                    },
                    child: const Text("进入第二页"));
              })
            ],
          )),
    );
  }
}

class SecondRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //Scaffold 类似于 LinearLayout 垂直方向
    return Scaffold(
      appBar: AppBar(
        title: Text("第二页", textDirection: TextDirection.ltr),
      ),
      body: Column(
        children: <Widget>[
          Text("第一个页面", textDirection: TextDirection.ltr),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text("返回", textDirection: TextDirection.ltr),
          )
        ],
      ),
    );
  }
}
