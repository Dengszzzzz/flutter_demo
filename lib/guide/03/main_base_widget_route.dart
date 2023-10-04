import 'package:flutter/material.dart';
import 'package:flutter_demo/guide/03/button_test_route.dart';
import 'package:flutter_demo/guide/03/image_test_route.dart';
import 'package:flutter_demo/guide/03/progress_indicator_test_route.dart';
import 'package:flutter_demo/guide/03/switch_checkbox_test_route.dart';
import 'package:flutter_demo/guide/03/text_field_form_test_route.dart';
import 'package:flutter_demo/guide/03/text_test_route.dart';
import 'package:flutter_demo/guide/util.dart';

import 'text_field_form_test_route2.dart';

///03.基础组件
class MainBaseWidgetRoute extends StatelessWidget {
  const MainBaseWidgetRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("03.基础组件"),),
      body: Column(
        children: [
          createItem(context, const TextTestRoute(), "文本及样式"),
          createItem(context, const ButtonTestRoute(), "按钮"),
          createItem(context, const ImageTestRoute(), "图片及Icon"),
          createItem(context, const SwitchAndCheckBoxTestRoute(), "单选开关和复选框"),
          createItem(context, const TextFieldAndFormTestRoute(), "输入框及表单"),
          createItem(context, const TextFieldAndFormTestRoute2(), "输入框及表单2"),
          createItem(context, const ProgressIndicatorTestRoute(), "进度条指示器"),
        ],
      ),
    );
  }


}
