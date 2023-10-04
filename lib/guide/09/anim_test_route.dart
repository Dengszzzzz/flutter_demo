import 'package:flutter/material.dart';

///最基础的动画实现
class AnimTestRoute extends StatefulWidget {
  const AnimTestRoute({super.key});

  @override
  State<AnimTestRoute> createState() => _AnimTestRouteState();
}

class _AnimTestRouteState extends State<AnimTestRoute>
    with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(duration: Duration(seconds: 2), vsync: this);

    //图片宽高从0变到300
    animation = Tween(begin: 0.0, end: 300.0).animate(controller)
      ..addListener(() {
        setState(() {});
      });

    //启动动画(正向执行)
    controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset(
        "images/ic_img_avatar.png",
        width: animation.value,
        height: animation.value,
      ),
    );
  }
}
