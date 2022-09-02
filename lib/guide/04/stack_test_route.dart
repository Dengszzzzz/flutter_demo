import 'package:flutter/material.dart';

class StackTestRoute extends StatefulWidget {
  const StackTestRoute({Key? key}) : super(key: key);

  @override
  State<StackTestRoute> createState() => _StackTestRouteState();
}

class _StackTestRouteState extends State<StackTestRoute> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("层叠布局 Stack、Positioned"),
      ),
      body: ConstrainedBox(
        constraints: BoxConstraints.expand(), //确保Stack占满整个屏幕
        child: Stack(
          alignment: Alignment.center, //指定未定位或部分定位widget的对齐方式
          fit: StackFit.expand,  //未定位widget占满Stack整个空间
          children: [
            //它会居中
            Container(
              width: 50,  //被fit影响，指定无效了，很明显是被父widget约束了
              height: 80,
              child: const Text(
                'Hello world',
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.red,
            ),

            //指定水平方向定位，竖直方向收alignment的影响
            const Positioned(
              left: 18.0,
              child: Text("靠左"),
            ),

            const Positioned(
              child: Text("靠上"),
              top: 18.0,
            ),
          ],
        ),
      ),
    );
  }

  Widget _chipWidget(String ivText, String labelText) {
    return Chip(
      label: Text(labelText),
      avatar: CircleAvatar(
        backgroundColor: Colors.blue,
        child: Text(ivText),
      ),
    );
  }
}
