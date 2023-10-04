
import 'package:flutter_bloc/flutter_bloc.dart';

///自定义一个全局Bloc观察者，观察所有的bloc和cubit状态改变
class AppBlocObserver extends BlocObserver{

  const AppBlocObserver();

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    if(bloc is Cubit) print(change);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    print(transition);
  }
}