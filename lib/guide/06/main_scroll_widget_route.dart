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
import 'package:flutter_demo/guide/06/page_view_test_route.dart';
import 'package:flutter_demo/guide/06/scroll_controller_test_route.dart';
import 'package:flutter_demo/guide/06/scroll_notification_test_route.dart';
import 'package:flutter_demo/guide/06/single_child_scrollview_test_route.dart';
import 'package:flutter_demo/guide/06/tab_bar_view_test_route.dart';
import 'package:flutter_demo/guide/06/tab_bar_view_test_route2.dart';
import 'package:flutter_demo/util.dart';



///06.可滚动组件
class MainScrollWidgetRoute extends StatelessWidget {
  const MainScrollWidgetRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("06.可滚动组件"),),
      body: Column(
        children: [
          createItem(context, const SingleChildScrollViewTestRoute(), "SingleChildScrollView"),
          createItem(context, const ListViewTestRoute(), "ListView"),
          createItem(context, const InfiniteListViewTestRoute(), "ListView实例使用"),
          createItem(context, const ScrollControllerTestRoute(), "ScrollController 滚动监听"),
          createItem(context, const ScrollNotificationTestRoute(), "ScrollNotification 滚动通知"),
          createItem(context, const GridViewTestRoute(), "GridView"),
          createItem(context, const InfiniteGridViewTestRoute(), "GridView.builder"),
          createItem(context, const PageViewTestRoute(), "PageView"),
          createItem(context, const TabBarViewTestRoute(), "TabBarView - TabController"),
          createItem(context, const TabBarViewTestRoute2(), "TabBarView - DefaultTabController"),
          createItem(context, const CustomScrollViewTestRoute(), "CustomScrollView"),

        ],
      ),
    );
  }


}
