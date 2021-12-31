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
        appBar: AppBar(title:Text("第一个页面")),
        body: ElevatedButton(
            onPressed: () {
              //导航到新路由

              /// 这段代码运行有问题：
              /// Navigator operation requested with a context that does not include a Navigator.
              /// `Navigator`实际上也是一个Widget，这个异常出现在`Navigator.of(context)`路由器的获取上，
              /// 而这句代码会**从当前的context的父级一层层向上去查找一个`Navigator`**，
              /// 我们当前传递的context就是MyApp，它的父级是root——UI根节点。
              /// `Navigator`这个widget的并不是由root创建的，因此在root下一级的上下文中无法获得`Navigator`。
              ///
              /// 解决方案：
              /// MaterialApp内部就会创建一个Navigator，源码跟踪如下：
              /// MaterialApp->\_MaterialAppState->WidgetsApp->\_WidgetsAppState
              ///
              /// 解决方法有三：
              /// 1.在MaterialApp以下用Buidler包裹一层。
              /// 2.在MaterialApp下再创建一个 Widget。
              /// 3.使用navigatorKey
              ///
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return SecondRoute();
              }));
            },
            child: Text("进入第二页")
        )
      ),
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
          ElevatedButton(onPressed: () {
            Navigator.pop(context);
          }
            , child: Text("返回", textDirection: TextDirection.ltr),)
        ],
      ),
    );
  }
}

