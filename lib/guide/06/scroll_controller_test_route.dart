import 'package:flutter/material.dart';

/// ScrollController 滚动监听
class ScrollControllerTestRoute extends StatefulWidget {
  const ScrollControllerTestRoute({Key? key}) : super(key: key);

  @override
  State<ScrollControllerTestRoute> createState() =>
      _ScrollControllerTestRouteState();
}

class _ScrollControllerTestRouteState extends State<ScrollControllerTestRoute> {

  ScrollController _controller = ScrollController();
  bool showToTopBtn = false; //是否显示“返回到顶部”按钮

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      print(_controller.offset); //打印滚动位置
      if (_controller.offset < 1000 && showToTopBtn) {
        setState(() {
          showToTopBtn = false;
        });
      } else if (_controller.offset >= 1000 && showToTopBtn == false) {
        setState(() {
          showToTopBtn = true;
        });
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("滚动控制"),),
      body: Scrollbar(
        child: ListView.builder(
          itemBuilder: (context, index) => ListTile(title: Text("$index"),),
          itemCount: 100,
          itemExtent: 50,
          controller: _controller,),
      ),
      floatingActionButton: !showToTopBtn ? null : FloatingActionButton(
        onPressed: () {
          //无动画的
          //_controller.jumpTo(.0);
          //返回顶部时执行动画
          _controller.animateTo(.0, duration: Duration(milliseconds: 200), curve: Curves.ease);
        }, child: const Icon(Icons.arrow_upward),),
    );
  }
}
