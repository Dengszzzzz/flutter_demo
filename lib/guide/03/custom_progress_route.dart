import 'package:flutter/material.dart';

//自定义进度指示器样式
class CustomProgressRoute extends StatefulWidget {
  const CustomProgressRoute({Key? key}) : super(key: key);

  @override
  State<CustomProgressRoute> createState() => _CustomProgressRouteState();
}

class _CustomProgressRouteState extends State<CustomProgressRoute> with SingleTickerProviderStateMixin{
  late AnimationController _animationController;

  @override
  void initState() {
    _animationController = AnimationController(
        vsync: this,
        //注意State类需要混入SingleTickerProviderStateMixin（提供动画帧计时/触发器）
        duration: Duration(seconds: 3));
    _animationController.forward();
    _animationController.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(16),
            child: LinearProgressIndicator(
              backgroundColor: Colors.grey[200],
              valueColor: ColorTween(begin: Colors.red, end: Colors.blue)
                  .animate(_animationController), //从灰色变为蓝色
              value: _animationController.value,
            ),
          ),
        ],
      ),
    );
  }
}
