import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'my_model.dart';

class FutureProviderTestRoute extends StatelessWidget {
  const FutureProviderTestRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text("count:${context.watch<MyModel4>().count} "),
        ElevatedButton(
            onPressed: () {
              context.read<MyModel4>().changeCount();
            },
            child: Text("add")),
      ],
    );
  }
}
