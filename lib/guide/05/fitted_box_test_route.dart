import 'package:flutter/material.dart';
import 'package:flutter_demo/guide/05/single_line_fitted_box.dart';

class FittedBoxTestRoute extends StatefulWidget {
  const FittedBoxTestRoute({Key? key}) : super(key: key);

  @override
  State<FittedBoxTestRoute> createState() => _FittedBoxTestRouteState();
}

class _FittedBoxTestRouteState extends State<FittedBoxTestRoute> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("空间适配"),
      ),
      body: Column(
        children: [
          //情况一：可以理解为Container -> FittedBox -> Container约束条件的传递，指定BoxFit.none不适配，
          //但FittedBox没有把约束条件传给第二个Container，所以它显示还是60*70蓝色。
          //但是Container自身的约束条件是不被子Widget影响的，所以相当于它还是占了50*50的空间，而Text跟在它后面build
          _wContainer(BoxFit.none),
          Text('Wendux'),

          //情况同上， 只是这里指定了包含，也就是60*70会按比例缩小放到50*50里，很明显按高度缩放，最终变为[60*5/7,50]。
          _wContainer(BoxFit.contain),
          Text('Flutter中国'),

          // Row(
          //   children: [
          //     Text('Flutter中国Flutter中国Flutter中国Flutter中国Flutter中国Flutter中国Flutter中国Flutter中国Flutter中国Flutter中国Flutter中国'),
          //   ],
          // ),
          //溢出
          Row(
            children: [
              Text('Flutter' * 10),
            ],
          ),
          //不溢出
          FittedBox(
            fit: BoxFit.contain,
            //  clipBehavior: Clip.hardEdge,
            child: Row(
              children: [
                Text('Flutter' * 10),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _wContainer(BoxFit boxFit) {
    return Container(
      width: 50,
      height: 50,
      color: Colors.red,
      child: FittedBox(
        fit: boxFit,
        //设置子容器超过父容器
        child: Container(
          width: 60,
          height: 70,
          color: Colors.blue,
        ),
      ),
    );
  }

  ///单行缩放布局
  Widget _singleLineFittedTest() {
    return Center(
      child: Column(
        children: [
          _wRow(' 90000000000000000 '),
          FittedBox(
            child: _wRow(' 90000000000000000 '),
          ),

          //横均分
          _wRow(' 800 '),

          ///现象：没有均分3等分
          ///在指定主轴对齐方式为 spaceEvenly 的情况下，Row 在进行布局时会拿到父组件的约束，
          ///如果约束的 maxWidth 不是无限大，则 Row 会根据子组件的数量和它们的大小在主轴方向
          ///来根据 spaceEvenly 填充算法来分割水平方向的长度，最终Row 的宽度为 maxWidth；
          ///但如果 maxWidth 为无限大时，就无法在进行分割了，所以此时 Row 就会将子组件的宽度之和作为自己的宽度。
          ///
          /// 当 Row 没有被 FittedBox 包裹时，此时父组件传给 Row 的约束的 maxWidth 为屏幕宽度，
          /// 此时，Row 的宽度也就是屏幕宽度，而当被FittedBox 包裹时，FittedBox 传给 Row 的约束
          /// 的 maxWidth 为无限大（double.infinity），因此Row 的最终宽度就是子组件的宽度之和。
          FittedBox(child: _wRow(' 800 ')),

          SingleLineFittedBox(
            child: _wRow(' 800 '),
          ),
          SingleLineFittedBox(
            child: _wRow(' 90000000000000000 '),
          ),
        ]
            .map((e) => Padding(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: e,
                ))
            .toList(),
      ),
    );
  }

  Widget _wRow(String text) {
    Widget child = Text(text);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [child, child, child],
    );
  }
}
