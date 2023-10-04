
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

///Cubit的用法
///1、创建 Cubit，定义管理的状态类型，这里是ThemeData
class ThemeCubit extends Cubit<ThemeData>{

  ///这里指定初始状态，一般通过外部值传入
  ThemeCubit() : super(_lightTheme);

  void toggleTheme() {
    ///2、状态变化，通过emit发射一个新状态， state 获取 Cubit 的当前状态
    ///注意：emit 只能在Cubit内部调用。
    emit(state.brightness == Brightness.dark ? _lightTheme : _darkTheme);
  }

  ///3、状态监听
  ///初始值是不会调用 onChange 方法的，一个 Change 由 currentState 和 nextState 组成。
  ///Change { currentState: ThemeData#ecfea, nextState: ThemeData#bb79d }
  @override
  void onChange(Change<ThemeData> change) {
    super.onChange(change);
    print('ThemeCubit - onChange:$change');
  }

  ///4、关闭Cubit，不需要监听Cubit的状态时，可以调用close();关闭

  static final _lightTheme = ThemeData(
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      foregroundColor: Colors.white,
    ),
    brightness: Brightness.light,
  );

  static final _darkTheme = ThemeData(
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      foregroundColor: Colors.black,
    ),
    brightness: Brightness.dark,
  );
}