import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Flutter Demo', home: MainRoute());
  }
}

class MainRoute extends StatelessWidget {
  const MainRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("主页"),
      ),
      body: Column(
        children: [
          Text("第一个页面"),
          ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    PageRouteBuilder(
                        transitionDuration: Duration(milliseconds: 500),
                        pageBuilder: (BuildContext context,
                            Animation<double> animation,
                            Animation<double> secondaryAnimation) {
                          //透明渐变与旋转
                          /*return FadeTransition(
                        opacity: animation,
                        child: RotationTransition(
                          turns: Tween(begin: 0.5, end: 1.0).animate(animation),
                          child: SecondRoute(),
                        ),
                      );*/

                          //平移
                          return SlideTransition(
                            ///Tween:在补间动画中，定义开始点结束点
                              position: Tween<Offset>(
                                      begin: const Offset(1.0, 0.0),
                                      end: const Offset(0.0, 0.0))
                                  .animate(animation),
                              child: SecondRoute());
                        }));
              },
              child: Text("进入第二页")),
        ],
      ),
    );
  }
}

class SecondRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("第二页"),
      ),
      body: Column(
        children: <Widget>[
          Text("第一个页面"),
          RaisedButton(
            onPressed: () {
              //路由pop弹出
              Navigator.pop(context, "结束");
            },
            child: Text("返回"),
          )
        ],
      ),
    );
  }
}
