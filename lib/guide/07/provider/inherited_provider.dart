import 'package:flutter/material.dart';

///数据保存的地方：
///自实现Provider，有助于理解Flutter官方出的状态管理包的Provider
//一个通用的InheritedWidget，保存需要跨组件共享的状态
class InheritedProvider<T> extends InheritedWidget {
  const InheritedProvider({
    required this.data,
    required Widget child,
  }) : super(child: child);

  final T data;

  @override
  bool updateShouldNotify(InheritedProvider<T> oldWidget) {
    //在此简单返回true，则每次更新都会调用依赖其的子孙节点的 didChangeDependencies.
    return true;
  }
}
