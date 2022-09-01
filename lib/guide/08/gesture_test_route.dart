
import 'package:flutter/material.dart';

///手势识别
class GestureTestRoute extends StatefulWidget {
  const GestureTestRoute({Key? key}) : super(key: key);

  @override
  State<GestureTestRoute> createState() => _GestureTestRouteState();
}

class _GestureTestRouteState extends State<GestureTestRoute> {

  String _operation = "No Gesture detected!"; //保存事件名

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        child: Container(
          alignment: Alignment.center,
          color: Colors.blue,
          width: 200.0,
          height: 100.0,
          child: Text(
            _operation,
            style: TextStyle(color: Colors.white),
          ),
        ),
        onTap: ()=> updateText("Tap"), //点击
        onDoubleTap: ()=> updateText("doubleTap"), //双击
        onLongPress: ()=> updateText("LongPress"), //长按
      ),
    );
  }

  void updateText(String text){
    setState(() {
      _operation = text;
    });
  }
}
