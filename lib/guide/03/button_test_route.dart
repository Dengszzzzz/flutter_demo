
import 'package:flutter/material.dart';

class ButtonTestRoute extends StatelessWidget {
  const ButtonTestRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("按钮"),),
      body: Column(
        children: [
          //"漂浮"按钮，它默认带有阴影和灰色背景。按下后，阴影会变大
          ElevatedButton(onPressed: ()=>{
            print("这是漂浮按钮")
          }, child: Text("Normal")),

          //文本按钮，默认背景透明并不带阴影。按下后，会有背景色
          TextButton(onPressed: ()=> print("这是文本按钮"), child: Text("normal")),

          //默认有一个边框，不带阴影且背景透明。按下后，边框颜色会变亮、同时出现背景和阴影(较弱)
          OutlinedButton(onPressed: ()=> print("这是边框按钮"), child: Text("normal")),

          //是一个可点击的Icon，不包括文字，默认没有背景，点击后会出现背景
          IconButton(onPressed: (){}, icon: Icon(Icons.thumb_up)),

          //带图标的按钮
          ElevatedButton.icon(onPressed: (){}, icon: Icon(Icons.send), label: Text("发送")),
          TextButton.icon(onPressed: (){}, icon: Icon(Icons.add), label: Text("发送")),
          OutlinedButton.icon(onPressed: (){}, icon: Icon(Icons.info), label: Text("详情")),
        ],
      ),
    );
  }
}
