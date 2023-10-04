import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'my_model.dart';

class ProviderTestRoute extends StatelessWidget {
  const ProviderTestRoute({Key? key}) : super(key: key);

  ///最基础的 provider 组成，接收一个任意值并暴露它。
  ///读取值
  ///context.watch<T>()，widget 能够监听到 T 类型的 provider 发生的改变。
  ///context.read<T>()，直接返回 T，不会监听改变。
  ///context.select<T，R>(R cb(T value))，允许 widget 只监听 T 上的一部分内容的改变。
  ///Provider.of<T>(context) == watch，Provider.of<T>(context,listen: false) == read
  ///注意：context.read<T>()不会在值变化时让 widget 重新构建，不允许在build内调用。
  ///但是在build里使用也不会报错，只是不建议这么做，容易导致其他bug，毕竟在widget树的往往希望能监听到变化去更新的

  ///例子1:演示了watch 和 read的用法和使用限制，以及它们和 Provider.of listen的关系。
  ///1）在build里用watch，在点击事件之类的地方用read。
  ///2）watch是监听可能改变的value，如果这个value是永远不改变的？是否可用read呢？其实更推荐用select。
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        //不监听MyModel，只监听MyModel的valueThatNeverChanges
        Text("never:${context.select((MyModel value) => value.valueThatNeverChanges )} "),
        // == watch
        //  Text("count:${Provider.of<MyModel>(context).count}"),
        //为什么read也可以？不是说不能在build里面吗？其实只是建议在这里用watch而已
        Text("count:${context.read<MyModel>().count} "),
        // Text("count:${myModel.count}"),

        ElevatedButton(
            onPressed: () {
              //Tried to listen to a value exposed with provider, from outside of the widget tree.
              // This is likely caused by an event handler (like a button's onPressed) that called
              // Provider.of without passing `listen: false`.
              // context.watch<MyModel>().changeCount();  //用它会报错，也就是不能在widget tree 范围外监听
              //这里不能用watch了。 == read
              Provider.of<MyModel>(context,listen: false).changeCount();
              // myModel.changeCount();
            },
            child: Text("add")),
      ],
    );
  }

  //
  //
  //
  // Widget _changeNotifyProvider() {
  //   return ChangeNotifierProvider<MyModel2>(
  //     create: (BuildContext context) {
  //       return MyModel2();
  //     },
  //     builder: (context,child){
  //       return Row(
  //         children: [
  //           //Text("never:${context.select((MyModel2 value) => value.valueThatNeverChanges )} "),
  //           Text("count:${context.watch<MyModel2>().count} "),
  //           // Text("count:${context.read<MyModel2>().count} "),
  //           ElevatedButton(
  //               onPressed: () {
  //                 context.read<MyModel2>().changeCount();
  //               },
  //               child: Text("add")),
  //         ],
  //       );
  //     },
  //     // child: ,
  //   );
  // }
}
