import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_demo/stateManagerDemo/bloc/theme_cubit.dart';

import 'counter_page.dart';

///https://pub-web.flutter-io.cn/packages/flutter_bloc/example
///https://www.jianshu.com/p/7a579a9ab029
///
/// bloc 可以通过2个类来管理任何类型的状态，Cubit 和 Bloc ，它们都继承自 BlocBase类
/// cubit 通过函数来触发 UI 状态改变
/// Bloc  通过事件来触发 UI 状态改变
class BlocMainRoute extends StatelessWidget {
  const BlocMainRoute({Key? key}) : super(key: key);

  //const BlocMainRoute({super.key});
  @override
  Widget build(BuildContext context) {
    ///BlocProvider
    ///1）BlocProvider 创建 bloc ，其子级可通过 BlocProvider.of <T>（context) 获取 bloc ,
    ///在这种情况下， 由于 BlocProvider 负责创建 bloc，它将自动处理关闭 bloc。

    return BlocProvider(
      lazy: true,  //默认懒加载，想create立即执行可设置为false
      create: (_) => ThemeCubit(),
      ///BlocBuilder
      ///BlocBuilder 它需要 bloc 和 builder 两个方法。BlocBuilder 在接收到新的状态
      ///( State )时处理 builder 组件。
      child: BlocBuilder<ThemeCubit, ThemeData>(
       // bloc: ,  //不传，会自动查找bloc，widget.bloc 和 context.read<B>。
        builder: (_, theme) {
          return MaterialApp(
            theme: theme,
            home: const CounterPage(),
          );
        },
        ///buildWhen 获取先前的 Bloc 的 state 和当前的 state 并返回 bool 值。
        ///如果返回 true，则会调用 builder 使用当前 state 重新构建，如果返回 false，
        ///则不会调用builder，也不会进行重建。
        // buildWhen: (previousState, state) {
        //   return true;
        // },
      ),
    );
  }
}
