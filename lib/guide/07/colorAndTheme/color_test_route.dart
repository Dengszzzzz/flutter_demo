
import 'package:flutter/material.dart';
import 'package:flutter_demo/guide/07/colorAndTheme/nav_bar.dart';

class ColorTestRoute extends StatefulWidget {
  const ColorTestRoute({Key? key}) : super(key: key);

  @override
  State<ColorTestRoute> createState() => _ColorTestRouteState();
}

class _ColorTestRouteState extends State<ColorTestRoute> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //背景为蓝色，则title自动为白色
        NavBar(color: Colors.blue, title: "标题"),
        //背景为白色，则title自动为黑色
        NavBar(color: Colors.white, title: "标题"),
      ],
    );
  }
}
