import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'my_model.dart';

class ChangeNotifyProviderTestRoute extends StatelessWidget {
  const ChangeNotifyProviderTestRoute({Key? key}) : super(key: key);

  ///演示了ChangeNotifyProvider 和 Provider的区别，但还是看不出watch和read的局限性
  @override
  Widget build(BuildContext context) {
    return _buildWidget1(context);
  }

  //这是用Provider.of
  _buildWidget1(context){
    return Row(
      children: [
        Text("never:${context.select((MyModel2 value) => value.valueThatNeverChanges )} "),
        Text("count:${context.watch<MyModel2>().count} "),
        //Text("count:${context.read<MyModel2>().count} "),
        ElevatedButton(
            onPressed: () {
              // context.watch<MyModel2>().changeCount();
              //这里不能用watch了。 == read
              context.read<MyModel2>().changeCount();
              //Provider.of<MyModel2>(context,listen: false).changeCount();
              // MyModel2.changeCount();
            },
            child: Text("add")),
      ],
    );
  }
}
