import 'package:flutter/material.dart';

///实战中，如果需要 TabBar 和 TabBarView 联动，通常会创建一个 DefaultTabController
///作为它们共同的父级组件，这样它们在执行时就会从组件树向上查找，都会使用我们指定的这个 DefaultTabController
class TabBarViewTestRoute2 extends StatefulWidget {
  const TabBarViewTestRoute2({Key? key}) : super(key: key);

  @override
  State<TabBarViewTestRoute2> createState() => _TabBarViewTestRoute2State();
}

class _TabBarViewTestRoute2State extends State<TabBarViewTestRoute2> {
  
  List tabs = ["新闻", "历史", "图片"];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(length: tabs.length, child:
    Scaffold(
      appBar: AppBar(
        title: Text("TabBarView"),
        bottom: TabBar(
          tabs: tabs.map((e) {
            //这里可以是任何widget，不过Material 组件库中已经实现了一个 Tab 组件，一般使用它即可。
            //注意：Tab 的 text和child是互斥的，不能同时指定。
            return Tab(
              text: e,
            );
          }).toList(),
        ),
      ),
      body: TabBarView(
        children: tabs.map((e) {
          return Container(
            alignment: Alignment.center,
            child: Text(e, textScaleFactor: 5),
          );
        }).toList(),
      ),
    ));
  }

}
