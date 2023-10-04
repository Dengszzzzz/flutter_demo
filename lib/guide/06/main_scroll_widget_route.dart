import 'package:flutter/material.dart';
import 'package:flutter_demo/guide/05/container_test_route.dart';
import 'package:flutter_demo/guide/05/fitted_box_test_route.dart';
import 'package:flutter_demo/guide/05/scaffold_test_route.dart';
import 'package:flutter_demo/guide/05/scaffold_test_route2.dart';
import 'package:flutter_demo/guide/06/custom_scroll_view_test_route.dart';
import 'package:flutter_demo/guide/06/grid_view_test_route.dart';
import 'package:flutter_demo/guide/06/infinite_grid_view_test_route.dart';
import 'package:flutter_demo/guide/06/infinite_list_view_test_route.dart';
import 'package:flutter_demo/guide/06/list_view_test_route.dart';
import 'package:flutter_demo/guide/06/nest_scroll_view_test_route.dart';
import 'package:flutter_demo/guide/06/page_view_test_route.dart';
import 'package:flutter_demo/guide/06/scroll_controller_test_route.dart';
import 'package:flutter_demo/guide/06/scroll_notification_test_route.dart';
import 'package:flutter_demo/guide/06/single_child_scrollview_test_route.dart';
import 'package:flutter_demo/guide/06/tab_bar_view_test_route.dart';
import 'package:flutter_demo/guide/06/tab_bar_view_test_route2.dart';
import 'package:flutter_demo/guide/util.dart';

import 'nested_scroll_view_test_route2.dart';
import 'nested_scroll_view_test_route3.dart';



///06.可滚动组件
///https://book.flutterchina.club/chapter6/intro.html#_6-1-1-sliver%E5%B8%83%E5%B1%80%E6%A8%A1%E5%9E%8B
///基于Sliver的列表按需加载模型
///Flutter 中的可滚动组件主要由三个角色组成：Scrollable、Viewport 和 Sliver
///Scrollable ：用于处理滑动手势，确定滑动偏移，滑动偏移变化时构建 Viewport 。
///Viewport：显示的视窗，即列表的可视区域；
///Sliver：视窗里显示的元素。
class MainScrollWidgetRoute extends StatelessWidget {
  const MainScrollWidgetRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("06.可滚动组件"),),
      body: Column(
        children: [
          createItem(context, const SingleChildScrollViewTestRoute(), "SingleChildScrollView"),
         // createItem(context, const ListViewTestRoute(), "ListView"),
          createItem(context, const InfiniteListViewTestRoute(), "ListView实例使用"),
          createItem(context, const ScrollControllerTestRoute(), "ScrollController 滚动监听"),
          createItem(context, const ScrollNotificationTestRoute(), "ScrollNotification 滚动通知"),
        //  createItem(context, const GridViewTestRoute(), "GridView"),
          createItem(context, const InfiniteGridViewTestRoute(), "GridView.builder"),
          createItem(context, const PageViewTestRoute(), "PageView"),
          createItem(context, const TabBarViewTestRoute(), "TabBarView - TabController"),
          createItem(context, const TabBarViewTestRoute2(), "TabBarView - DefaultTabController"),
          createItem(context, const CustomScrollViewTestRoute(), "CustomScrollView"),
          createItem(context, const NestScrollViewTestRoute(), "NestScrollView"),
          createItem(context, const NestedScrollViewTestRoute2(), "NestScrollView + tabBar吸顶"),
          createItem(context, const NestedScrollViewTestRoute3(), "tabBar吸顶,titleBar显示"),

        ],
      ),
    );
  }


}
