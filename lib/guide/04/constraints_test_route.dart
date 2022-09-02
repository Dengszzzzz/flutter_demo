import 'package:flutter/material.dart';

class ConstraintsTestRoute extends StatefulWidget {
  const ConstraintsTestRoute({Key? key}) : super(key: key);

  @override
  State<ConstraintsTestRoute> createState() => _ConstraintsTestRouteState();
}

class _ConstraintsTestRouteState extends State<ConstraintsTestRoute> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("布局原理与约束 constraints"),
      ),
      body: Column(
        children: [
          ///1.ConstrainedBox 用于对子组件添加额外的约束
          ConstrainedBox(
            constraints: const BoxConstraints(
                minWidth: double.infinity, //宽度尽可能大
                minHeight: 50.0 //最小高度为50像素
                ),
            child: Container(
              height: 5.0, //可以看到，这个height没生效，因为小于父Widget的约束条件
              child: redBox,
            ),
          ),

          ///2.SizedBox 用于给子元素指定固定的宽高
          SizedBox(
            width: 80.0,
            height: 80.0,
            child: redBox,
          ),

          ///3.多重限制，其实可以从子->父考虑限制，将子当做是个宽90，高20的控件，再考虑父限制。
          ///此处结果是宽90,60
          ConstrainedBox(
            constraints: const BoxConstraints(minWidth: 60.0, minHeight: 60.0),
            //父
            child: ConstrainedBox(
              constraints:
                  const BoxConstraints(minWidth: 90.0, minHeight: 20.0), //子
              child: redBox,
            ),
          ),

          ///4.UnconstrainedBox 去除限制,一般很少直接使用此组件，此处结果是 90 x 20
          ///但是注意，此处红色区域是90 x 20，但上方仍然有40的空白控件，也就是minHeight 60.0还是生效的，
          ///只是它不影响最终子元素redBox的大小。但仍然还是占有相应的空间，可以认为此时的
          ///父ConstrainedBox是作用于子UnconstrainedBox上，而redBox只受子ConstrainedBox限制。
          ConstrainedBox(
            constraints: const BoxConstraints(minWidth: 60.0, minHeight: 60.0),//父
            child: UnconstrainedBox(
              child: ConstrainedBox(
                constraints:
                    const BoxConstraints(minWidth: 90.0, minHeight: 20.0), //子
                child: redBox,
              ),
            ),
          ),

        ],
      ),
    );
  }

  Widget redBox =
      const DecoratedBox(decoration: BoxDecoration(color: Colors.red));
}
