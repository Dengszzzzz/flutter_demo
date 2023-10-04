import 'package:flutter/material.dart';

///无论是MaterialPageRoute、CupertinoPageRoute，还是PageRouteBuilder，
///它们都继承自PageRoute类，而PageRouteBuilder其实只是PageRoute的一个包装
class FadeRoute extends PageRoute {
  FadeRoute({
    required this.builder,
    this.transitionDuration = const Duration(milliseconds: 300),
    this.opaque = true,
    this.barrierDismissible = false,
    this.barrierColor,
    this.barrierLabel,
    this.maintainState = true,
  });

  final WidgetBuilder builder;

  @override
  final Duration transitionDuration;

  @override
  final bool opaque;

  @override
  final bool barrierDismissible;

  @override
  final Color? barrierColor;

  @override
  final String? barrierLabel;

  @override
  final bool maintainState;


  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) => builder(context);

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    ///启动退出都会执行动画
    // return FadeTransition(
    //   opacity: animation,
    //   child: builder(context),
    // );

    ///只在启动执行动画，退出不执行,其实在需要判断路由状态时再使用它好些
    ///当前路由被激活，是打开新路由
    if(isActive) {
      return FadeTransition(
        opacity: animation,
        child: builder(context),
      );
    }else{
      //是返回，则不应用过渡动画
      return Padding(padding: EdgeInsets.zero);
    }
  }


}