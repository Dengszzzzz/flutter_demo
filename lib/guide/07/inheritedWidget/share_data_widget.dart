import 'package:flutter/material.dart';

///继承InheritedWidget，将当前计数器点击次数保存在ShareDataWidget的data属性中：
class ShareDataWidget extends InheritedWidget {
  const ShareDataWidget({
    Key? key,
    required this.data,
    required Widget child,
  }) : super(key:key,child: child);

  //需要在子树中共享的数据，保存点击次数
  final int data;

  //该回调决定当data发生变化时，是否通知子树中依赖data的Widget重新build
  @override
  bool updateShouldNotify(ShareDataWidget oldWidget) {
    return oldWidget.data != data;
  }

  //定义一个便捷方法，方便子树中的Widget获取共享数据
  static ShareDataWidget? of(BuildContext context) {
   // return context.getElementForInheritedWidgetOfExactType<ShareDataWidget>()?.widget as ShareDataWidget;
     //dependOnInheritedXXX 注册了依赖关系
    return context.dependOnInheritedWidgetOfExactType<ShareDataWidget>();
  }
}


