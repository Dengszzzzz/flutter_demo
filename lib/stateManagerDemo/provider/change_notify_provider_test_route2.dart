import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'my_model.dart';

class ChangeNotifyProviderTestRoute2 extends StatelessWidget {
  const ChangeNotifyProviderTestRoute2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("ChangeNotifyProviderTestRoute2 -- builder");
    return ChangeNotifierProvider<MyModel2>(
      create: (BuildContext context) {
        return MyModel2();
      },
      child: Consumer<MyModel2>(
        builder: (_, myModel, noBuildChild){
          return Row(
            children: [
              Text("count:${myModel.count} "),
              ElevatedButton(
                  onPressed: () {myModel.changeCount();},
                  child: Text("add")),
              noBuildChild!,
            ],
          );
        },
        //这个child作为builder最后一个参数，也就是上面的noBuildChild，当有变化时，回调到Consumer，
        //这个child不会调用build方法。
        child: TempTextWidget(tip: "检测是否变化了",),
      ),
    );
  }
}


class TempTextWidget extends StatelessWidget {

  final String tip;
  const TempTextWidget({Key? key,required this.tip}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('TempTextWidget -- build');
    return Text(tip);
  }
}

