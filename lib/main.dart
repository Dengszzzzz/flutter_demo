import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_demo/guide/03/main_base_widget_route.dart';
import 'package:flutter_demo/guide/03/text_test_route.dart';
import 'package:flutter_demo/guide/04/main_layout_widget_route.dart';
import 'package:flutter_demo/guide/05/main_container_widget_route.dart';
import 'package:flutter_demo/guide/06/main_scroll_widget_route.dart';
import 'package:flutter_demo/guide/07/colorAndTheme/color_test_route.dart';
import 'package:flutter_demo/guide/07/colorAndTheme/theme_test_route.dart';
import 'package:flutter_demo/guide/07/future_builder_test_route.dart';
import 'package:flutter_demo/guide/07/inheritedWidget/inherited_widget_test_route.dart';
import 'package:flutter_demo/guide/07/main_function_widget_route.dart';
import 'package:flutter_demo/guide/07/provider/provider_route.dart';
import 'package:flutter_demo/guide/07/stream_builder_test_route.dart';
import 'package:flutter_demo/guide/07/value_listenable_test_route.dart';
import 'package:flutter_demo/guide/08/main_event_widget_route.dart';
import 'package:flutter_demo/guide/08/notification_test_route.dart';
import 'package:flutter_demo/stateManagerDemo/bloc/app_bloc_observer.dart';
import 'package:flutter_demo/stateManagerDemo/state_manager_route.dart';
import 'package:flutter_demo/ui/page/page_artice.dart';

import 'guide/07/dialog/alert_dialog_test_route.dart';
import 'guide/08/drag_test_route.dart';
import 'guide/08/gesture_test_route.dart';
import 'guide/08/pointer_move_test_route.dart';
import 'guide/09/main_anim_widget_route.dart';
import 'guide/10/main_custom_widget_route.dart';
import 'guide/util.dart';

void main() {
  Bloc.observer = const AppBlocObserver();
  runApp(ArticleApp());
}

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
        body: Builder(builder: (context) {
          return Column(
            children: [
              createItem(context, const MainBaseWidgetRoute(), "03.基础组件"),
              createItem(context, const MainLayoutWidgetRoute(), "04.布局组件"),
              createItem(context, const MainContainerWidgetRoute(), "05.容器组件"),
              createItem(context, const MainScrollWidgetRoute(), "06.可滚动组件"),
              createItem(context, const MainFunctionWidgetRoute(), "07.功能型组件"),
              createItem(context, const MainEventWidgetRoute(), "08.事件处理与通知"),
              createItem(context, const MainAnimWidgetRoute(), "09.动画"),
              createItem(context, const MainCustomWidgetRoute(), "10.自定义Widget"),
              createItem(context, const StateManagerRoute(), "--状态管理demo"),
            ],
          );
        }),


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
        //body: NotificationTestRoute(),

        // body: new InfiniteListView(),
        //body: new ArticlePage(),
      ),
    );
    return Container();
  }

}

