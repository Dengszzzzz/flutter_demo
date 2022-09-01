
import 'package:flutter/material.dart';
import 'package:flutter_demo/guide/08/bus/event_bus.dart';

///原始指针事件处理
class PointerMoveTestRoute extends StatefulWidget {
  const PointerMoveTestRoute({Key? key}) : super(key: key);

  @override
  State<PointerMoveTestRoute> createState() => _PointerMoveTestRouteState();
}

class _PointerMoveTestRouteState extends State<PointerMoveTestRoute> {

  /*
  * PointerDownEvent、 PointerMoveEvent、 PointerUpEvent 都是PointerEvent的子类，
  * PointerEvent类中包括当前指针的一些信息。
  *
  * position：它是指针相对于当对于全局坐标的偏移。
  * localPosition: 它是指针相对于当对于本身布局坐标的偏移。
  * delta：两次指针移动事件（PointerMoveEvent）的距离。
  * pressure：按压力度，如果手机屏幕支持压力传感器(如iPhone的3D Touch)，此属性会更有意义，如果手机不支持，则始终为1。
  * orientation：指针移动方向，是一个角度值。
  *
  * */
  PointerEvent? _event;

  @override
  Widget build(BuildContext context) {
    return Listener(
      child: Container(
        alignment: Alignment.center,
        color: Colors.blue,
        width: 300.0,
        height: 150.0,
        child: Text(
          '${_event?.localPosition ?? ''}',
          style: TextStyle(color: Colors.white),
        ),
      ),
      onPointerDown: (PointerDownEvent event) => setState(() {
        _event = event;
        bus.emit("test","这是Bus发送的test数据");
      }),
      onPointerMove: (PointerMoveEvent event) => setState(() {
        _event = event;
      }),
      onPointerUp: (PointerUpEvent event) => setState(() {
        _event = event;
      }),
    );
  }

  @override
  void initState() {
    bus.on("test", (arg) {
      print("收到Bus - test - $arg");
    });
    super.initState();
  }

  @override
  void dispose() {
    bus.off("test");
    super.dispose();
  }
}
