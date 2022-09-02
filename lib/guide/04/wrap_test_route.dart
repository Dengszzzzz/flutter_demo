import 'package:flutter/material.dart';

class WrapTestRoute extends StatefulWidget {
  const WrapTestRoute({Key? key}) : super(key: key);

  @override
  State<WrapTestRoute> createState() => _WrapTestRouteState();
}

class _WrapTestRouteState extends State<WrapTestRoute> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("流式布局 Wrap"),
      ),
      body: Column(
        children: [
          //超出范围报溢出错误
          Row(
            children: [
              Text("xxx" * 100,maxLines: 1,),
            ],
          ),


          //会自动折行
          Wrap(
            children: [
              Text("xxx" * 100),
            ],
          ),

          Wrap(
            spacing: 8.0, //主轴(水平)方向间距
            runSpacing: 4.0, //纵轴(垂直)方向间距
            alignment: WrapAlignment.center, //沿主轴方向居中
            children: [
              _chipWidget('A', 'Hamilton'),
              _chipWidget('M', 'Lafayette'),
              _chipWidget('H', 'Mulligan'),
              _chipWidget('J', 'Laurens'),
            ],
          )
        ],
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
