import 'package:flutter/material.dart';

class ContainerTestRoute extends StatefulWidget {
  const ContainerTestRoute({Key? key}) : super(key: key);

  @override
  State<ContainerTestRoute> createState() => _ContainerTestRouteState();
}

class _ContainerTestRouteState extends State<ContainerTestRoute> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("容器组件Container"),
      ),
      body: Column(
        children: [
          _decoratedBox(),
          _containerWidget(),

        ],
      ),
    );
  }

  //装饰容器
  Widget _decoratedBox() {
    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [Colors.red,Colors.blue,Colors.orange.shade700]),
        borderRadius: BorderRadius.circular(3.0),
        boxShadow: const [
          BoxShadow(
            color: Colors.black54,
            offset: Offset(2.0,2.0),
            blurRadius: 4.0,
          ),
        ]
      ),
      child: const Padding(
        padding: EdgeInsets.symmetric(vertical: 18.0, horizontal: 80),
        child: Text(
          "Login",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  Widget _containerWidget(){
    return Container(
      margin: const EdgeInsets.only(top: 50.0,left: 120.0),
      //卡片大小(tightFor相当定义了max和min的宽高)
      constraints: const BoxConstraints.tightFor(width: 200.0,height: 150.0),
      //装饰
      decoration: const BoxDecoration(
        //背景径向渐变
        gradient: RadialGradient(colors: [Colors.red,Colors.orange],center: Alignment.topRight,radius: .98),
        boxShadow: [
          BoxShadow(
            color: Colors.black54,
            offset: Offset(2.0,2.0),
            blurRadius: 4.0,
          )
        ]
      ),
      //变换：卡片倾斜
      transform: Matrix4.rotationZ(.2),
      //卡片内文字居中
      alignment: Alignment.center,
      child: const Text(
        //卡片文字
        "5.20",
        style: TextStyle(
          color: Colors.white,
          fontSize: 40.0,
        ),
      ),
    );
  }
}
