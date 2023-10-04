import 'package:flutter/material.dart';
import 'package:flutter_demo/stateManagerDemo/provider/change_notify_provider_test_route.dart';
import 'package:flutter_demo/stateManagerDemo/provider/future_provider_test_route.dart';
import 'package:flutter_demo/stateManagerDemo/provider/provider_test_route.dart';
import 'package:flutter_demo/stateManagerDemo/provider/stream_provider_test_route.dart';
import 'package:provider/provider.dart';

import '../../guide/util.dart';
import 'change_notify_provider_test_route2.dart';
import 'my_model.dart';

/// Provider详解
/// https://pub-web.flutter-io.cn/packages/provider
class ProviderMainRoute extends StatelessWidget {
  const ProviderMainRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('状态管理Demo'),
      ),
      body: Column(
        children: [
          Text("01-provider"),
          _provider(),
          Text("02-changeNotifyProvider"),
          _changeNotifyProvider2(),
          //Text("03-valueListenableProvider"),
          //_valueListenableProvider(),
          Text("03-futureProvider"),
          _futureProvider(),
          Text("04-streamProvider"),
          _streamProvider(),
        ],
      ),
    );
  }

  Widget _provider() {
    return Provider(
      create: (BuildContext context) {
        return MyModel();
      },
      child: ProviderTestRoute(),
    );
  }

  Widget _changeNotifyProvider() {
    return ChangeNotifierProvider<MyModel2>(
      create: (BuildContext context) {
        return MyModel2();
      },
      child: ChangeNotifyProviderTestRoute(),
    );
  }

  Widget _changeNotifyProvider2() {
    return ChangeNotifyProviderTestRoute2();
  }

  ///3.ListenableProvider
  /// ListenableProvider 提供（provide）的对象是继承了 Listenable 抽象类的子类。
  /// 由于无法混入，所以通过继承来获得 Listenable 的能力，同时必须实现其 addListener / removeListener方法，
  /// 手动管理收听者。显然，这样太过复杂，我们通常都不需要这样做。
  /// 由于ChangeNotifier继承自Listenable，所以ChangeNotifier也可用于ListenableProvider，但此情况下，
  /// ListenableProvider不会自动调用ChangeNotifier的dispose()，而ChangeNotifierProvider会。
  /// 基本不使用这个。
  // Widget _listenableProvider() {
  //   return ListenableProvider<MyModel3>(
  //     create: (BuildContext context) {
  //       return MyModel3();
  //     },
  //     child: ChangeNotifyProviderTestRoute(),
  //   );
  // }

  ///用于提供实现了 继承/混入/实现了 ValueListenable 的 Model。
  ///它实际上是专门用于处理只有一个单一变化数据的 ChangeNotifier。
  ///监听 ValueListenable，并且只暴露出 ValueListenable.value。
  ///应用场景为止
  Widget _valueListenableProvider() {
    final counter = ValueNotifier(0);
    return ValueListenableProvider<int>.value(
      value: counter,
      child: Row(
        children: [
          Text("count:${counter.value} "),
          ElevatedButton(
              onPressed: () {
                counter.value++;
              },
              child: Text("add")),
        ],
      ),
    );
  }

  ///FutureProvider
  ///用于共享异步操作的结果。它可以包装一个Future，并在Future完成时更新UI。
  ///简单来说，FutureProvider用于提供在组件树中准备好使用其值时可能尚未准备好的值，主要是
  ///确保空值不会传递给任何子组件，而且FutureProvider有一个初始值，子组件可以使用该Future值
  ///并告诉子组件使用新的值来进行重建。
  ///1）FutureProvider只会重建一次，默认显示初始值，然后显示Future值，最后不会再次重建。
  ///FixMe:都是stateless，是如何做到又刷新UI的？
  Widget _futureProvider() {
    return FutureProvider<MyModel4>(
      initialData: MyModel4(count: -1),
      create: (BuildContext context) {
        return MyModel4Future().asyncGetMyModel4();
      },
      child: FutureProviderTestRoute(),
    );
  }

  ///监听流，并暴露出当前的最新值。
  Widget _streamProvider() {
    var myModel5 = MyModel5();
    return StreamProvider(
      initialData: -1,
      create: (BuildContext context) {
        print('StreamProvider -- create');
        return myModel5.getStream();
      },
      child: Row(
        children: [
          StreamProviderTestRoute(),
          ElevatedButton(
              onPressed: () {
                myModel5.changeCount();
              },
              child: Text("add")),
        ],
      ),
    );
  }
}
