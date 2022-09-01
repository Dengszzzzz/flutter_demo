import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ScrollNotificationTestRoute extends StatefulWidget {
  const ScrollNotificationTestRoute({Key? key}) : super(key: key);

  @override
  State<ScrollNotificationTestRoute> createState() =>
      _ScrollNotificationTestRouteState();
}

class _ScrollNotificationTestRouteState
    extends State<ScrollNotificationTestRoute> {
  String _progress = "0%";

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      child: NotificationListener<ScrollNotification>(
        onNotification: (ScrollNotification notification) {
          ///在接收到滚动事件时，参数类型为ScrollNotification，它包括一个metrics属性，
          ///它的类型是ScrollMetrics，该属性包含当前ViewPort及滚动位置等信息：
          // pixels：当前滚动位置。
          // maxScrollExtent：最大可滚动长度。
          // extentBefore：滑出ViewPort顶部的长度；此示例中相当于顶部滑出屏幕上方的列表长度。
          // extentInside：ViewPort内部长度；此示例中屏幕显示的列表部分的长度。
          // extentAfter：列表中未滑入ViewPort部分的长度；此示例中列表底部未显示到屏幕范围部分的长度。
          // atEdge：是否滑到了可滚动组件的边界（此示例中相当于列表顶或底部）。
          double progress = notification.metrics.pixels /
              notification.metrics.maxScrollExtent;
          //重新构建
          setState(() {
            _progress = "${(progress * 100).toInt()}%";
          });
          return false;
          //return true; //放开此行注释后，进度条将失效
        },
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            ListView.builder(
                itemCount: 100,
                itemExtent: 50.0,
                itemBuilder: (context, index) => ListTile(
                      title: Text("$index"),
                    )),
            CircleAvatar(
              radius: 30.0,
              child: Text(_progress),
              backgroundColor: Colors.black54,
            )
          ],
        ),
      ),
    );
  }
}
