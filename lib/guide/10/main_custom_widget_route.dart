
import 'package:flutter/material.dart';
import 'package:flutter_demo/guide/10/custom_check_box_test.dart';

import '../util.dart';
import 'custom_paint_route.dart';

class MainCustomWidgetRoute extends StatelessWidget {
  const MainCustomWidgetRoute({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("10.自定义Widget"),
      ),
      body: Column(
        children: [
          createItem(context, const CustomPaintRoute(), "CustomPaintRoute"),
          createItem(context, const CustomCheckboxTest(), "CustomCheckboxTest"),
        ],
      ),
    );
  }
}
