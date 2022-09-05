import 'package:flutter/material.dart';
import 'package:flutter_demo/guide/07/colorAndTheme/color_test_route.dart';
import 'package:flutter_demo/guide/07/colorAndTheme/theme_test_route.dart';
import 'package:flutter_demo/guide/07/dialog/alert_dialog_test_route.dart';
import 'package:flutter_demo/guide/07/future_builder_test_route.dart';
import 'package:flutter_demo/guide/07/inheritedWidget/inherited_widget_test_route.dart';
import 'package:flutter_demo/guide/07/provider/provider_route.dart';
import 'package:flutter_demo/guide/07/stream_builder_test_route.dart';
import 'package:flutter_demo/guide/07/value_listenable_test_route.dart';
import 'package:flutter_demo/util.dart';

class MainFunctionWidgetRoute extends StatelessWidget {
  const MainFunctionWidgetRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("07.功能型组件"),
      ),
      body: Column(
        children: [
          createItem(context, const InheritedWidgetTestRoute(), "InheritedWidget"),
          createItem(context, const ProviderRoute(), "provider"),
          createItem(context, const ColorTestRoute(), "color"),
          createItem(context, const ThemeTestRoute(), "theme"),
          createItem(context, const ValueListenableRoute(), "valueListenable"),
          createItem(context, const FutureBuilderTestRoute(), "futureBuilder"),
          createItem(context, const StreamBuilderTestRoute(), "streamBuilder"),
          createItem(context, const AlertDialogTestRoute(), "dialog"),
        ],
      ),
    );
  }
}
