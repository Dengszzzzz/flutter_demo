
import 'package:flutter/material.dart';
import 'package:flutter_demo/guide/03/custom_progress_route.dart';

class ProgressIndicatorTestRoute extends StatefulWidget {

  const ProgressIndicatorTestRoute({Key? key}) : super(key: key);

  @override
  State<ProgressIndicatorTestRoute> createState() => _ProgressIndicatorTestRouteState();
}

class _ProgressIndicatorTestRouteState extends State<ProgressIndicatorTestRoute> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("进度指示器"),),
      body: Column(
        children: [

          /*
          value：value表示当前的进度，取值范围为[0,1]；如果value为null时则指示器会执行
                 一个循环动画（模糊进度）；当value不为null时，指示器为一个具体进度的进度条。
          backgroundColor：指示器的背景色。
          valueColor: 指示器的进度条颜色；值得注意的是，该值类型是Animation<Color>，
                  这允许我们对进度条的颜色也可以指定动画。如果我们不需要对进度条颜色执行动画
                  ，换言之，我们想对进度条应用一种固定的颜色，此时我们可以通过AlwaysStoppedAnimation来指定。
          * */

          // 模糊进度条(会执行一个动画)
          LinearProgressIndicator(
            backgroundColor: Colors.red[200],
            valueColor: const AlwaysStoppedAnimation(Colors.blue),
          ),

          //进度条显示50%
          LinearProgressIndicator(
            backgroundColor: Colors.grey[200],
            valueColor: const AlwaysStoppedAnimation(Colors.blue),
            value: 0.5,  //当前进度
          ),

          // 模糊进度条(会执行一个旋转动画)
          CircularProgressIndicator(
            backgroundColor: Colors.grey[200],
            valueColor: AlwaysStoppedAnimation(Colors.blue),
          ),

          CircularProgressIndicator(
            backgroundColor: Colors.grey[200],
            valueColor: AlwaysStoppedAnimation(Colors.blue),
            value: .5,
          ),

          // 线性进度条高度指定为3
          SizedBox(
            height: 3,
            child: LinearProgressIndicator(
              backgroundColor: Colors.grey[200],
              valueColor: AlwaysStoppedAnimation(Colors.blue),
              value: .5,
            ),
          ),
          // 圆形进度条直径指定为100
          SizedBox(
            height: 100,
            width: 100,
            child: CircularProgressIndicator(
              backgroundColor: Colors.grey[200],
              valueColor: AlwaysStoppedAnimation(Colors.blue),
              value: .7,
            ),
          ),

          CustomProgressRoute(),

        ],
      ),
    );
  }
}
