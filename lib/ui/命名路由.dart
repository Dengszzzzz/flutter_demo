
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// 命名路由
/// 命名路由的最大优点是直观，我们可以通过语义化的字符串来管理路由。
/// 但其有一个明显的缺点：不能直接传递路由参数。假设SecondRoute，
/// 需要接受一个字符串参数`tip`，然后再在屏幕中心将`tip`的内容显示出来。
/// 因为命名路由需要提前注册到路由表中，所以就无法动态修改`tip`参数。

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "命名路由",
      //home: MainRoute()
      //注册路由表
      routes: {
        /// '/'是特殊地址，代表第一个页面
        "/":(context){ return const MainRoute();},
        "new_page":(context) => SecondRoute()
      },
    );
  }
}

class MainRoute extends StatelessWidget {
  const MainRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("第一个页面标题")),
      body: Column(
        children: <Widget>[
          Text("第一个页面内容"),
          ElevatedButton(onPressed: (){
            //导航到新路由
            Navigator.pushNamed(context, "new_page");
          }, child: Text("进入第二个页面"))
        ],
      ),
    );
  }
}

class SecondRoute extends StatelessWidget {
  const SecondRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("第二个页面标题"),) ,
      body: Column(
        children: [
          Text("第二个页面内容"),
          ElevatedButton(onPressed: (){
            Navigator.pop(context,"结束");
          }, child: Text("返回"))
        ],
      ),
    );
  }
}


