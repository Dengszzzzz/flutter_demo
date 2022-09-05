
import 'package:flutter/material.dart';

class LayoutBuilderTestRoute extends StatefulWidget {
  const LayoutBuilderTestRoute({Key? key}) : super(key: key);

  @override
  State<LayoutBuilderTestRoute> createState() => _LayoutBuilderTestRouteState();
}

class _LayoutBuilderTestRouteState extends State<LayoutBuilderTestRoute> {
  @override
  Widget build(BuildContext context) {
    var _children = List.filled(6, const Text("A"));
    return Column(
      children: [
        //限制宽度为190，小于200
        SizedBox(width: 190,child: ResponsiveColumn(children: _children,),),
        ResponsiveColumn(children: _children),
      ],
    );
  }
}

///实现一个响应式的 Column 组件 ResponsiveColumn，它的功能是当当前可用的宽度小于 200 时
///，将子组件显示为一列，否则显示为两列。
class ResponsiveColumn extends StatelessWidget {
  const ResponsiveColumn({Key? key,required this.children}) : super(key: key);

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    //通过LayoutBuilder拿到父组件传递的约束，判断 maxWidth 是否小于200
    return LayoutBuilder(builder: (BuildContext context, BoxConstraints constraints){
      if(constraints.maxWidth < 200){
        // 最大宽度小于200，显示单列
        return Column(children: this.children,mainAxisSize: MainAxisSize.min,);
      }else{
        // 大于200，显示双列
        var _children = <Widget>[];
        for(var i=0;i<children.length;i+=2){
          if(i+1<children.length){
            //两个放一行，看起来就是两列了。
            _children.add(Row(
              children: [children[i],children[i+1]],
              mainAxisSize: MainAxisSize.min,
            ));
          }else{
            //最后可能会剩下一个，不需要用Row包裹了
            _children.add(children[i]);
          }
        }
        return Column(children: _children,mainAxisSize: MainAxisSize.min,);
      }
    });
  }
}

