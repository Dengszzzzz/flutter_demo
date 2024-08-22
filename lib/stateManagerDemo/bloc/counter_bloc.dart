

import 'package:flutter_bloc/flutter_bloc.dart';

///创建一个 Bloc 类似于创建一个 Cubit，除了定义我们将要管理的状态和初始值外，
///我们还必须定义 Event 使其能够处理事件。
///
///定义CounterBloc处理的事件
abstract class CounterEvent{}

///具体事件1
class CounterIncrementPressed extends CounterEvent{}
///具体事件2
class CounterDecrementPressed extends CounterEvent{}

///Bloc的用法，CounterEvent事件，int状态
class CounterBloc extends Bloc<CounterEvent,int>{

  CounterBloc() : super(0){
    ///1、通过 on<Event> 注册事件。
    on<CounterIncrementPressed>((event, emit) => emit(state + 1));
    on<CounterDecrementPressed>((
        CounterEvent event,
        Emitter<int> emit,
    ){
      emit(state-1);
    });
  }

  ///2、add事件来触发状态改变
  void addCounterIncrementPressed(){
    add(CounterIncrementPressed());
  }

  ///3、状态监听
  @override
  void onChange(Change<int> change) {
    super.onChange(change);
    print('CounterBloc - onChange:$change');
  }

  ///4、关闭Cubit，不需要监听Bloc的状态时，通过close();关闭

  ///5、状态转换
  ///Bloc 和 Cubit 之间的主要区别在于 onTransition ，由于 Bloc 是事件驱动的，
  ///因此我们也能够捕获有关触发状态更改的信息。
  ///onTransition 在 onChange 之前被调用。
  ///从一种状态到另一种状态的转换称为 Transition。Transition 由当前状态，事件和下一个状态组成
  ///{ currentState: 0, event: Instance of 'CounterIncrementPressed', nextState: 1 }
  // @override
  // void onTransition(Transition<CounterEvent, int> transition) {
  //   super.onTransition(transition);
  //   print('CounterBloc - onTransition:$transition');
  // }
}