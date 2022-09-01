import 'package:flutter/material.dart';

import 'change_notifier_provider.dart';

///针对以下代码做优化封装
///Builder(builder: (context){
///   var cart=ChangeNotifierProvider.of<CartModel>(context);
///   return Text("总价: ${cart.totalPrice}");
/// })
// 这是一个便捷类，会获得当前context和指定数据类型的Provider
class Consumer<T> extends StatelessWidget {
  const Consumer({Key? key, required this.builder}) : super(key: key);

  //定义一个方法，参数是BuildContext 和 T,返回值是Widget
  final Widget Function(BuildContext context, T? value) builder;

  @override
  Widget build(BuildContext context) {
    return builder(
      context,
      ChangeNotifierProvider.of<T>(context),
    );
  }
}
