import 'package:flutter/material.dart';
import 'package:flutter_demo/guide/04/align_test_route.dart';
import 'package:flutter_demo/guide/04/constraints_test_route.dart';
import 'package:flutter_demo/guide/04/flex_test_route.dart';
import 'package:flutter_demo/guide/04/layout_builder_test_route.dart';
import 'package:flutter_demo/guide/04/row_test_route.dart';
import 'package:flutter_demo/guide/04/wrap_test_route.dart';
import 'package:flutter_demo/util.dart';

import 'column_test_route.dart';
import 'stack_test_route.dart';


///04.布局组件
class MainLayoutWidgetRoute extends StatelessWidget {
  const MainLayoutWidgetRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("04.布局组件"),),
      body: Column(
        children: [
          createItem(context, const ConstraintsTestRoute(), "布局原理与约束 constraints"),
          createItem(context, const RowTestRoute(), "线性布局 Row"),
          createItem(context, const ColumnTestRoute(), "线性布局 Column"),
          createItem(context, const FlexTestRoute(), "弹性布局 Flex"),
          createItem(context, const WrapTestRoute(), "流式布局 Wrap、Flow"),
          createItem(context, const StackTestRoute(), "层叠布局 Stack、Positioned"),
          createItem(context, const AlignTestRoute(), "对齐与相对定位 Align"),
          createItem(context, const LayoutBuilderTestRoute(), "LayoutBuilder"),
        ],
      ),
    );
  }


}
