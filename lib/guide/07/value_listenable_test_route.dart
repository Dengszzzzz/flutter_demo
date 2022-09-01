
import 'package:flutter/material.dart';

///关于 ValueListenableBuilder 有两点需要牢记：
/// 和数据流向无关，可以实现任意流向的数据共享。
/// 实践中，ValueListenableBuilder 的拆分粒度应该尽可能细，可以提高性能。
class ValueListenableRoute extends StatefulWidget {
  const ValueListenableRoute({Key? key}) : super(key: key);

  @override
  State<ValueListenableRoute> createState() => _ValueListenableRouteState();
}

class _ValueListenableRouteState extends State<ValueListenableRoute> {
  // 定义一个ValueNotifier，当数字变化时会通知 ValueListenableBuilder
  final ValueNotifier<int> _counter = ValueNotifier<int>(0);

  @override
  Widget build(BuildContext context) {
    // 添加 + 按钮不会触发整个 ValueListenableRoute 组件的 build
    print('build');
    return Scaffold(
      appBar: AppBar(title: Text('ValueListenableBuilder 测试'),),
      body: Center(
        /// valueListenable：类型为 ValueListenable<T>，表示一个可监听的数据源。
        /// builder：数据源发生变化通知时，会重新调用 builder 重新 build 子组件树。
        /// child: builder 中每次都会重新构建整个子组件树，如果子组件树中有一些不变的部分，
        /// 可以传递给child，child 会作为builder的第三个参数传递给 builder，
        /// 通过这种方式就可以实现组件缓存，原理和AnimatedBuilder 第三个 child 相同。
      child: ValueListenableBuilder<int>(
          valueListenable: _counter,
          builder: (BuildContext context, int value, Widget? child){
            //builder方法只会在_counter变化时被调用
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                child!,
                Text('$value 次')
              ],
            );
          },
          // 当子组件不依赖变化的数据，且子组件收件开销比较大时，指定 child 属性来缓存子组件非常有用
          //也就是下面的Text(“点击了”)不会被重新build
          child: Text("点击了"),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: ()=> _counter.value+=1,
      ),
    );
  }
}
