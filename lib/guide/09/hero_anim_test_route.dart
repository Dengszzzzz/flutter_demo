
import 'package:flutter/material.dart';

class HeroAnimTestRoute extends StatelessWidget {
  const HeroAnimTestRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Hero(
        tag: "buttonText",
        child: Text("Hero动画演示"),
        //child: Image.asset("images/ic_img_avatar.png"),
      ),
    );
  }
}
