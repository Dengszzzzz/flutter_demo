
import 'package:flutter/material.dart';
import 'package:flutter_demo/guide/09/anim_test_route.dart';

import '../util.dart';
import 'fade_route.dart';

///路由切换动画
///MaterialPageRoute：和平台风格一致的路由动画，iOS上会左右滑动切换，Android上会上下滑动切换。
///如果Android想左右切换，直接用CupertinoPageRoute。如果要自定义，用PageRouteBuilder。


class PageRouteAnimTestRoute extends StatelessWidget {
  const PageRouteAnimTestRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("09.动画"),
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              //Navigator.push(context, MaterialPageRoute(builder: (context) => route));
              ///1、
              Navigator.push(
                  context,
                  PageRouteBuilder(
                      transitionDuration: const Duration(milliseconds: 500), //动画时间 500ms
                      //在路由切换时pageBuilder在每个动画帧都会被回调，因此我们可以通过animation对象来自定义过渡动画
                      //无论是MaterialPageRoute、CupertinoPageRoute，还是PageRouteBuilder，
                      // 它们都继承自PageRoute类，而PageRouteBuilder其实只是PageRoute的一个包装
                      pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
                        return FadeTransition(
                          //使用渐隐渐入过渡,
                          opacity: animation,
                          child: AnimTestRoute(), //路由B
                        );
                      })
              );


              ///2、和1效果相同
              ///实际使用时应优先考虑使用PageRouteBuilder
              ///如在应用过渡动画时我们需要读取当前路由的一些属性，就需要用到继承PageRoute的方式了，
              ///比如只想在打开新路由时应用动画，而在返回时不使用动画，
              Navigator.push(context, FadeRoute(builder: (context) {return AnimTestRoute();}));
            },
            child: Text("自定义路由动画演示"),
          ),
        ],
      ),
    );
  }
}

