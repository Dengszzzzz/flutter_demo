import 'package:flutter/material.dart';
import 'package:flutter_demo/guide/07/provider/inherited_provider.dart';

class ChangeNotifierProvider<T extends ChangeNotifier> extends StatefulWidget {
  ChangeNotifierProvider({
    Key? key,
    required this.data,
    required this.child,
  }) : super(key: key);

  T data; //订阅器
  Widget child;

  //定义一个便捷方法，方便子树中的Widget获取共享数据
  //第二个参数是指，是否要建立依赖关系
  static T of<T>(BuildContext context, {bool listen = true}) {
    final provider = listen
        ? context.dependOnInheritedWidgetOfExactType<InheritedProvider<T>>()
        : context
            .getElementForInheritedWidgetOfExactType<InheritedProvider<T>>()
            ?.widget as InheritedProvider<T>;
    return provider!.data;
  }

  @override
  State<ChangeNotifierProvider<T>> createState() =>
      _ChangeNotifierProviderState<T>();
}

///主要作用就是监听到共享状态（model）改变时重新构建Widget树。
///注意，在_ChangeNotifierProviderState类中调用setState()方法，
///widget.child始终是同一个，所以执行build时，InheritedProvider的child引用的始终
///是同一个子widget，所以widget.child并不会重新build，这也就相当于对child进行了
///缓存！当然如果ChangeNotifierProvider父级Widget重新build时，则其传入的child
///便有可能会发生变化。
class _ChangeNotifierProviderState<T extends ChangeNotifier>
    extends State<ChangeNotifierProvider<T>> {
  void update() {
    //如果数据发生变化（model类调用了notifyListeners），重新构建InheritedProvider
    setState(() {});
  }

  @override
  void didUpdateWidget(covariant ChangeNotifierProvider<T> oldWidget) {
    print("didUpdateWidget");
    //当Provider更新时，如果新旧数据不"=="，则解绑旧数据监听，同时添加新数据监听
    if (widget.data != oldWidget.data) {
      oldWidget.data.removeListener(update);
      widget.data.addListener(update);
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void initState() {
    //给model添加监听器
    widget.data.addListener(update);
    super.initState();
  }

  @override
  void dispose() {
    widget.data.removeListener(update);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.data == null) {
      print("widget.data = null");
    }
    if (widget.child == null) {
      print("widget.child = null");
    }
    //
    return InheritedProvider<T>(
      data: widget.data,
      child: widget.child,
    );
  }
}
