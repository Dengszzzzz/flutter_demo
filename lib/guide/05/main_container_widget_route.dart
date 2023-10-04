import 'package:flutter/material.dart';
import 'package:flutter_demo/guide/05/container_test_route.dart';
import 'package:flutter_demo/guide/05/fitted_box_test_route.dart';
import 'package:flutter_demo/guide/05/scaffold_test_route.dart';
import 'package:flutter_demo/guide/05/scaffold_test_route2.dart';
import 'package:flutter_demo/guide/util.dart';



///05.容器组件
class MainContainerWidgetRoute extends StatelessWidget {
  const MainContainerWidgetRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("05.容器组件"),),
      body: Column(
        children: [
          createItem(context, const ContainerTestRoute(), "容器组件"),
          createItem(context, const FittedBoxTestRoute(), "空间适配"),
          createItem(context, const ScaffoldTestRoute(), "页面骨架Scaffold"),
          createItem(context, const ScaffoldTestRoute2(), "BottomAppBar"),

        ],
      ),
    );
  }


}
