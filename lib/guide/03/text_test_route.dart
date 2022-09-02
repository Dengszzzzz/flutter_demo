import 'package:flutter/material.dart';

///文本及样式 （Text、TextStyle、TextSpan、DefaultTextStyle、字体）
class TextTestRoute extends StatefulWidget {
  const TextTestRoute({Key? key}) : super(key: key);

  @override
  State<TextTestRoute> createState() => _TextTestRouteState();
}

class _TextTestRouteState extends State<TextTestRoute> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("文本及样式"),),
      body:  Column(
        children: [
          ///1.Text
          const Text(
            "Hello word",
            textAlign: TextAlign.left, //文本对齐方式
          ),
          Text(
            "Hello world! I'm Jack. " * 10,
            maxLines: 3, //文本显示的最大行数
            overflow: TextOverflow.ellipsis, //接单方式，默认直接截断，此处用...
          ),
          const Text(
            "Hello world",
            // 代表文本相对于当前字体大小的缩放因子，相对于去设置文本的样式style属性的
            // fontSize，它是调整字体大小的一个快捷方式。该属性的默认值可以通过
            // MediaQueryData.textScaleFactor获得，如果没有MediaQuery，那么会默认值将为1.0
            textScaleFactor: 1.5,
          ),

          ///2.TextStyle
          Text(
            "Hello world",
            style: TextStyle(
              color: Colors.blue,
              fontSize: 18.0,
              //该属性用于指定行高，但它并不是一个绝对值，而是一个因子，具体的行高等于fontSize*height。
              height: 1.2,
              fontFamily: "Courier",
              background: Paint()..color = Colors.yellow,
              //装饰
              decoration: TextDecoration.underline,
              decorationStyle: TextDecorationStyle.dashed,
            ),
          ),

          ///3.TextSpan
          const Text.rich(TextSpan(children: [
            TextSpan(text: "Home: "),
            TextSpan(
              text: "https://flutterchina.club",
              style: TextStyle(color: Colors.blue),
              //这是点击后的处理，和手势相关
              // recognizer: _tapRecognizer
            ),
          ])),

          ///4.DefaultTextStyle
          DefaultTextStyle(
              style: const TextStyle(color: Colors.red, fontSize: 20.0),
              textAlign: TextAlign.start,
              child: Column(
                children: const [
                  Text("hello world"),
                  Text("I am Jack"),
                  Text(
                    "I am Jack",
                    style: TextStyle(
                        inherit: false, //2.不继承默认样式
                        color: Colors.grey),
                  ),
                ],
              )),

          ///5.字体
          const Text(
            "阿里普惠字体",
            style: TextStyle(fontFamily: 'Alibaba-PuHuiTi'),
          ),
        ],
      ),
    );
  }
}
