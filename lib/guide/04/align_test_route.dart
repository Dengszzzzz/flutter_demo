import 'package:flutter/material.dart';

class AlignTestRoute extends StatefulWidget {
  const AlignTestRoute({Key? key}) : super(key: key);

  @override
  State<AlignTestRoute> createState() => _AlignTestRouteState();
}

class _AlignTestRouteState extends State<AlignTestRoute> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("对齐与相对定位 Align"),
      ),
      body: Column(
        children: [

          //1.Align 组件可以调整子组件的位置
          Container(
            height: 120.0,
            width: 120.0,
            color: Colors.blue,
            child: const Align(
              //右上对齐，容器是120x120，child是60*60
              alignment: Alignment.topRight,
              child: FlutterLogo(
                size: 60,
              ),
            ),
          ),

          /**
           * widthFactor和heightFactor是用于确定Align 组件本身宽高的属性；
           * 它们是两个缩放因子，会分别乘以子元素的宽、高，最终的结果就是Align
           * 组件的宽高。如果值为null，则组件的宽高将会占用尽可能多的空间。
           * */
          //2.指定Align的Factor
          Container(
            color: Colors.blue,
            child: const Align(
              alignment: Alignment.topRight,
              //指定Factor ，宽高xFactor
              widthFactor: 1,
              heightFactor: 1,
              child: FlutterLogo(
                size: 60,
              ),
            ),
          ),

          /**
           * alignment : 需要一个AlignmentGeometry类型的值，
           * 表示子组件在父组件中的起始位置。AlignmentGeometry 是一个抽象类，
           * 它有两个常用的子类：Alignment和 FractionalOffset。
           * */
          //3.Alignment的公式 偏移量：[
          // x = (Alignment.x + 1) * (parentWidth - childWidth)/2
          // y = (Alignment.y + 1) * (parentHeight - childHeight)/2
          // 此处x =（2+1）* (120-60)/2 = 90，y = 1*（120-60）/2=30
          //所以此处偏移量是[90,30]
          Container(
            color: Colors.red,
            child: const Align(
              alignment: Alignment(2,0.0),
              widthFactor: 2,
              heightFactor: 2,
              child: FlutterLogo(
                size: 60,
              ),
            ),
          ),

          //4.FractionalOffset
          //FractionalOffset 继承自 Alignment，它和 Alignment唯一的区别就是坐标原点
          // 不同！FractionalOffset 的坐标原点为矩形的左侧顶点，这和布局系统的一致，
          // 所以理解起来会比较容易。FractionalOffset的坐标转换公式为：
          // 实际偏移 = (
          // x = FractionalOffset.x * (parentWidth - childWidth),
          // y = FractionalOffset.y * (parentHeight - childHeight)
          // 此处x= 0.2 * (120-60) = 12,y=0.6*(120-60)=36
          //这里是偏移 [12,36]
          Container(
            height: 120.0,
            width: 120.0,
            color: Colors.blue,
            child: const Align(
                alignment: FractionalOffset(0.2, 0.6),
              child: FlutterLogo(
                size: 60,
              ),
            ),
          ),


          //5.Center組件是Alignment.center的Align

          //6. 当widthFactor或heightFactor为null时组件的宽高将会占用尽可能多的空间
          const DecoratedBox(
            decoration: BoxDecoration(color: Colors.red),
            child: Center(
              child: Text("xxx"),
            ),
          ),
          const DecoratedBox(
            decoration: BoxDecoration(color: Colors.red),
            child: Center(
              widthFactor: 1,
              heightFactor: 1,
              child: Text("xxx"),
            ),
          ),

        ],
      ) ,
    );
  }


}
