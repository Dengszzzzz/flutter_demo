import 'package:flutter/material.dart';

class SwitchAndCheckBoxTestRoute extends StatefulWidget {
  const SwitchAndCheckBoxTestRoute({Key? key}) : super(key: key);

  @override
  State<SwitchAndCheckBoxTestRoute> createState() =>
      _SwitchAndCheckBoxTestRouteState();
}

class _SwitchAndCheckBoxTestRouteState
    extends State<SwitchAndCheckBoxTestRoute> {
  bool _switchSelected = true; //单选开关状态
  bool? _checkBoxSelected = true; //复选框状态

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("单选开关和复选框"),
      ),
      body: Column(
        children: [

          ///Checkbox的大小是固定的，无法自定义，而Switch只能定义宽度，高度也是固定的。

          Switch(
              value: _switchSelected,
              onChanged: (value) {
                setState(() {
                  _switchSelected = value;
                });
              }),

          //复选框value可能为null，可以指定三种状态
          Checkbox(
              value: _checkBoxSelected,
              activeColor: Colors.red, //选中时的颜色
              tristate: true,  //是否为三态，增加一个null
              onChanged: (value) {
                setState(() {
                  _checkBoxSelected = value;
                });
              })
        ],
      ),
    );
  }
}
