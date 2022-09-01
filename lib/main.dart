import 'package:flutter/material.dart';
import 'package:flutter_demo/demo/scrollview/infinite_list_view.dart';
import 'package:flutter_demo/guide/07/colorAndTheme/color_test_route.dart';
import 'package:flutter_demo/guide/07/colorAndTheme/theme_test_route.dart';
import 'package:flutter_demo/guide/07/future_builder_test_route.dart';
import 'package:flutter_demo/guide/07/inheritedWidget/inherited_widget_test_route.dart';
import 'package:flutter_demo/guide/07/provider/provider_route.dart';
import 'package:flutter_demo/guide/07/stream_builder_test_route.dart';
import 'package:flutter_demo/guide/07/value_listenable_test_route.dart';
import 'package:flutter_demo/guide/08/notification_test_route.dart';
import 'package:flutter_demo/ui/page/page_artice.dart';

import 'guide/07/dialog/alert_dialog_test_route.dart';
import 'guide/08/drag_test_route.dart';
import 'guide/08/gesture_test_route.dart';
import 'guide/08/pointer_move_test_route.dart';

void main() => runApp(ArticleApp());

/// 快捷键 stl stf
class ArticleApp extends StatelessWidget {
  const ArticleApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
              '文章',
              style: TextStyle(color: Colors.white)
          ),
        ),
        ///07.功能型组件
        //body: InheritedWidgetTestRoute(),
        //body: ProviderRoute(),
        //body: ColorTestRoute(),
        //body: ThemeTestRoute(),
        //body: ValueListenableRoute(),
        //body: FutureBuilderTestRoute(),
        //body: StreamBuilderTestRoute(),
        //body: AlertDialogTestRoute(),

        ///08.事件处理与通知
        //body: PointerMoveTestRoute(),
        //body: GestureTestRoute(),
        //body: DragTestRoute(),
        body: NotificationTestRoute(),

        // body: new InfiniteListView(),
        //body: new ArticlePage(),
      ),
    );
    return Container();
  }
}

