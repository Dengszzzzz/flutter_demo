import 'package:flutter/material.dart';

class TabBarViewTestRoute extends StatefulWidget {
  const TabBarViewTestRoute({Key? key}) : super(key: key);

  @override
  State<TabBarViewTestRoute> createState() => _TabBarViewTestRouteState();
}

class _TabBarViewTestRouteState extends State<TabBarViewTestRoute>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  List tabs = ["新闻", "历史", "图片"];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: tabs.length, vsync: this);
  }

  /// TabBar 和 TabBarView 共用一个 TabController
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TabBarView"),

        ///TabBar 为 TabBarView 的导航标题
        bottom: TabBar(
          controller: _tabController,
          tabs: tabs.map((e) {
            //这里可以是任何widget，不过Material 组件库中已经实现了一个 Tab 组件，一般使用它即可。
            //注意：Tab 的 text和child是互斥的，不能同时指定。
            return Tab(
              text: e,
            );
          }).toList(),
        ),
      ),

      ///TabBarView 封装了 PageView
      body: TabBarView(
        controller: _tabController,
        children: tabs.map((e) {
          return Container(
            alignment: Alignment.center,
            child: Text(e, textScaleFactor: 5),
          );
        }).toList(),
      ),
    );
  }

  @override
  void dispose() {
    // 释放资源
    _tabController.dispose();
    super.dispose();
  }
}
