import 'package:flutter/material.dart';

class ImageTestRoute extends StatelessWidget {
  const ImageTestRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var img = AssetImage("imgs/ic_error.png");

    String icons = "";
// accessible: 0xe03e
    icons += "\uE03e";
// error:  0xe237
    icons += " \uE237";
// fingerprint: 0xe287
    icons += " \uE287";

    return Scaffold(
      appBar: AppBar(
        title: Text("图片及Icon"),
      ),
      body: Column(
        children: [
          Image.asset(
            "images/ic_error.png",
            width: 100.0,
          ),
          Image.network(
            "https://avatars2.githubusercontent.com/u/20411648?s=460&v=4",
            width: 100.0,
          ),

          /*
          * Image({
  ...
  this.width, //图片的宽
  this.height, //图片高度
  this.color, //图片的混合色值
  this.colorBlendMode, //混合模式
  this.fit,//缩放模式
  this.alignment = Alignment.center, //对齐方式
  this.repeat = ImageRepeat.noRepeat, //重复方式
  ...
})
          *
          *
          * */

          //color和 colorBlendMode：在图片绘制时可以对每一个像素进行颜色混合处理，
          // color指定混合色，而colorBlendMode指定混合模式
          Image.asset(
            "images/ic_error.png",
            width: 100.0,
            color: Colors.blue,
            colorBlendMode: BlendMode.difference,
          ),

         /* const Image(
            image: AssetImage("images/ic_error.png"),
            width: 100.0,
            height: 200.0,
            repeat: ImageRepeat.repeatY,
          ),*/

          Text(
            icons,
            style: TextStyle(
              fontFamily: "MaterialIcons",
              fontSize: 24.0,
              color: Colors.green,
            ),
          ),
/*
          SingleChildScrollView(
            child: Column(
                children: <Image>[
              Image(
                image: img,
                height: 50.0,
                width: 100.0,
                fit: BoxFit.fill,
              ),
              Image(
                image: img,
                height: 50,
                width: 50.0,
                fit: BoxFit.contain,
              ),
              Image(
                image: img,
                width: 100.0,
                height: 50.0,
                fit: BoxFit.cover,
              ),
              Image(
                image: img,
                width: 100.0,
                height: 50.0,
                fit: BoxFit.fitWidth,
              ),
              Image(
                image: img,
                width: 100.0,
                height: 50.0,
                fit: BoxFit.fitHeight,
              ),
              Image(
                image: img,
                width: 100.0,
                height: 50.0,
                fit: BoxFit.scaleDown,
              ),
              Image(
                image: img,
                height: 50.0,
                width: 100.0,
                fit: BoxFit.none,
              ),
              Image(
                image: img,
                width: 100.0,
                color: Colors.blue,
                colorBlendMode: BlendMode.difference,
                fit: BoxFit.fill,
              ),
              Image(
                image: img,
                width: 100.0,
                height: 200.0,
                repeat: ImageRepeat.repeatY,
              )
            ].map((e) {
              return Row(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(16.0),
                    child: SizedBox(
                      width: 100,
                      child: e,
                    ),
                  ),
                  Text(e.fit.toString())
                ],
              );
            }).toList()),
          ),*/
        ],
      ),
    );
  }
}
