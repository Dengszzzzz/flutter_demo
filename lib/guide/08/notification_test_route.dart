import 'package:flutter/material.dart';

class NotificationTestRoute extends StatefulWidget {
  const NotificationTestRoute({Key? key}) : super(key: key);

  @override
  State<NotificationTestRoute> createState() => _NotificationTestRouteState();
}

class _NotificationTestRouteState extends State<NotificationTestRoute> {
  @override
  Widget build(BuildContext context) {
    // NotificationListener<ScrollEndNotification>
    // 也可以指定模板参数，这样onNotification 只会回调 ScrollEndNotification 时才回调。
    return Scaffold(
        appBar: AppBar(
        title: Text("07.功能型组件"),
    ),
    body: NotificationListener(
      onNotification: (notification) {
        switch (notification.runtimeType) {
          case ScrollStartNotification:
            print("开始滚动");
            break;
          case ScrollUpdateNotification:
            print("正在滚动");
            break;
          case ScrollEndNotification:
            print("滚动停止");
            break;
          case OverscrollNotification:
            print("滚动到边界");
            break;
        }
        return true;
      },
      child: ListView.builder(
        itemCount: 100,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('$index'),
          );
        },
      ),
    ));
  }
}
