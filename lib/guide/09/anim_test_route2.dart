import 'package:flutter/material.dart';


///addListener()和setState()是通用的，
///AnimatedWidget类封装了调用setState()的细节，并允许我们将 widget 分离出来。
class AnimatedImage extends AnimatedWidget{

  const AnimatedImage({
    Key? key,
    required Listenable listenable,
  }):super(key: key,listenable: listenable);

  @override
  Widget build(BuildContext context) {
    final animation = listenable as Animation<double>;
    return Center(
      child: Image.asset(
        "images/ic_img_avatar.png",
        width: animation.value,
        height: animation.value,
      ),
    );
  }
}

class AnimTestRoute2 extends StatefulWidget {
  const AnimTestRoute2({super.key});

  @override
  State<AnimTestRoute2> createState() => _AnimTestRoute2State();
}

class _AnimTestRoute2State extends State<AnimTestRoute2>
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
    //把定义的animation创给子Widget
    return AnimatedImage(listenable: animation,);
  }
}

