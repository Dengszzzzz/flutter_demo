import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'my_model.dart';

class StreamProviderTestRoute extends StatelessWidget {

  const StreamProviderTestRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (
        BuildContext context,
        int value,
        Widget? child,
    ){
      return Text("count:${value} ");
    });
  }
}
