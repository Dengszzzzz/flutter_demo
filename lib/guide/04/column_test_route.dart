import 'package:flutter/material.dart';

class ColumnTestRoute extends StatefulWidget {
  const ColumnTestRoute({Key? key}) : super(key: key);

  @override
  State<ColumnTestRoute> createState() => _ColumnTestRouteState();
}

class _ColumnTestRouteState extends State<ColumnTestRoute> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("线性布局 Column"),
      ),
      body: Row(
        children: [
          //居中，此处纵轴是水平方向
          //由于没有指定mainAxisSize，所以使用默认值MainAxisSize.max，此处占据了整个空间高度。
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Hi"),
              Text("world"),
            ],
          ),

          //如果Row里面嵌套Row，或Column嵌套Column，那么只有最外层的Row或Column会占用尽可能大的空间，里面的Row和Column是实际大小
          Container(
            color: Colors.green,
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max, //有效，外层column高度为整个屏幕
                children: [
                  Container(
                    color: Colors.red,
                    child: Column(
                      mainAxisSize: MainAxisSize.max, //无效，内存column高度为实际高度
                      children: const <Widget>[
                        Text("hello world "),
                        Text("I am Jack "),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),


          Container(
            color: Colors.green,
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max, //有效，外层column高度为整个屏幕
                children: [
                  //如果要让里面的column占满外部Column，可以使用Expanded组件
                   Expanded(
                    child: Container(
                      color: Colors.red,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const <Widget>[
                          Text("hello world "),
                          Text("I am Jack "),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
