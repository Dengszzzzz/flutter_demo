
import 'package:flutter/material.dart';

class RowTestRoute extends StatefulWidget {
  const RowTestRoute({Key? key}) : super(key: key);

  @override
  State<RowTestRoute> createState() => _RowTestRouteState();
}

class _RowTestRouteState extends State<RowTestRoute> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("线性布局 Row"),),
      body:Column(
        //测试Row对齐方式，排除Column默认居中对齐的干扰
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //对于Row来说，主轴就是水平方向，这里指定主轴对齐方式是居中，所以这里居中
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: _textWidgetList(),
          ),
          //主轴大小为尽可能小，所以主轴对齐方式无效了
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: _textWidgetList(),
          ),
          //textDirection表示水平方向子组件的布局顺序，此处是右到左。也就是正常是 AB排列，现在是BA排列了。
          //mainAxisAlignment如果是start，那么此时BA是右对齐了，此处是end，所以是左对齐。
          Row(
            textDirection: TextDirection.rtl,
            mainAxisAlignment: MainAxisAlignment.end,
            children: _textWidgetList(),
          ),
          //这里可以看到根绝rtl进行了正对齐
          Row(
            textDirection: TextDirection.rtl,
            mainAxisAlignment: MainAxisAlignment.start,
            children: _textWidgetList(),
          ),

          //纵轴start对齐，可以理解为正对齐。竖直方向是从下往上，所以底对齐
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            verticalDirection: VerticalDirection.up,
            children: _textWidgetList(),
          )

        ],
      ),
    );
  }

  List<Widget> _textWidgetList(){
    return [
      const Text(" hello world "),
      const Text(" I am Jack "),
    ];
  }

}
