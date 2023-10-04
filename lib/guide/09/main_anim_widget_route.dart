import 'package:flutter/material.dart';
import 'package:flutter_demo/guide/09/anim_test_route.dart';
import 'package:flutter_demo/guide/09/anim_test_route2.dart';
import 'package:flutter_demo/guide/09/hero_anim_test_route.dart';
import 'package:flutter_demo/guide/09/page_route_anim_test_route.dart';

import '../util.dart';
import 'anim_test_route3.dart';
import 'animated_switcher_test_route.dart';

class MainAnimWidgetRoute extends StatelessWidget {
  const MainAnimWidgetRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("09.动画"),
      ),
      body: Column(
        children: [
          createItem(context, const AnimTestRoute(), "动画基本结构及监听"),
          createItem(context, const AnimTestRoute2(), "AnimatedWidget"),
          createItem(context, const AnimTestRoute3(), "AnimatedBuilder"),
          createItem(context, const PageRouteAnimTestRoute(), "PageRouteAnimTestRoute"),
          _createHeroAnim(context),
          createItem(context, const AnimatedSwitcherCounterRoute(), "AnimatedSwitcher"),

        ],
      ),
    );
  }

  _createHeroAnim(BuildContext context){
    return ElevatedButton(
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(
            builder: (context) => HeroAnimTestRoute()));
      },
      child: Hero(
        tag: "buttonText",  //唯一标识，前后两个路由页Hero的tag必须相同
        child: Text("Hero动画演示"),
      ),
    );
  }
}
