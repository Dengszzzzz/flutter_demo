import 'package:flutter/material.dart';
import 'package:flutter_demo/guide/07/colorAndTheme/color_test_route.dart';
import 'package:flutter_demo/guide/07/colorAndTheme/theme_test_route.dart';
import 'package:flutter_demo/guide/07/dialog/alert_dialog_test_route.dart';
import 'package:flutter_demo/guide/07/future_builder_test_route.dart';
import 'package:flutter_demo/guide/07/inheritedWidget/inherited_widget_test_route.dart';
import 'package:flutter_demo/guide/07/provider/provider_route.dart';
import 'package:flutter_demo/guide/07/stream_builder_test_route.dart';
import 'package:flutter_demo/guide/07/value_listenable_test_route.dart';
import 'package:flutter_demo/guide/08/drag_test_route.dart';
import 'package:flutter_demo/guide/08/gesture_test_route.dart';
import 'package:flutter_demo/guide/08/notification_test_route.dart';
import 'package:flutter_demo/guide/08/pointer_move_test_route.dart';
import 'package:flutter_demo/util.dart';

class MainEventWidgetRoute extends StatelessWidget {
  const MainEventWidgetRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("08.事件处理与通知"),
      ),
      body: Column(
        children: [
          createItem(context, const PointerMoveTestRoute(), "PointerMove"),
          createItem(context, const GestureTestRoute(), "Gesture"),
          createItem(context, const DragTestRoute(), "drag"),
          createItem(context, const NotificationTestRoute(), "notification"),
        ],
      ),
    );
  }
}
