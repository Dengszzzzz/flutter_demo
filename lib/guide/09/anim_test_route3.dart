import 'package:flutter/material.dart';

///AnimatedBuilder
///1) 自动添加帧监听器，调用setState()，这个好处和AnimatedWidget一样。
///2）动画每一帧需要构建的 widget 的范围缩小了。
  ///3）便于动画的复用和组合，例如系统提供的FadeTransition、ScaleTransition等。
class AnimTestRoute3 extends StatefulWidget {
  const AnimTestRoute3({super.key});

  @override
  State<AnimTestRoute3> createState() => _AnimTestRoute3State();
}

class _AnimTestRoute3State extends State<AnimTestRoute3>
    with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(duration: Duration(seconds: 2), vsync: this);

    //图片宽高从0变到300
    animation = Tween(begin: 0.0, end: 300.0).animate(controller);
    // ..addListener(() {
    //   setState(() {});
    // });
    
    ///动画状态监听
    animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        //动画执行结束时反向执行动画
        controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        //动画恢复到初始状态时执行动画（正向）
        controller.forward();
      }
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
    return AnimatedBuilder(
        animation: animation,
        child: Image.asset("images/ic_img_avatar.png"),
        builder: (context, child) {
          return Center(
            child: SizedBox(
              height: animation.value,
              width: animation.value,
              child: child,
            ),
          );
        });
  }
}

///FadeTransition、ScaleTransition、SizeTransition等同理
class GrowTransition extends StatelessWidget {
  const GrowTransition({Key? key,
    required this.animation,
    this.child,
  }) : super(key: key);

  final Widget? child;
  final Animation<double> animation;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedBuilder(
        animation: animation,
        builder: (BuildContext context, child) {
          return SizedBox(
            height: animation.value,
            width: animation.value,
            child: child,
          );
        },
        child: child,
      ),
    );
  }
}
