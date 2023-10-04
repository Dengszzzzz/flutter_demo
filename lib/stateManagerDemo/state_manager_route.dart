
import 'package:flutter/material.dart';
import 'package:flutter_demo/stateManagerDemo/bloc/bloc_main_route.dart';
import 'package:flutter_demo/stateManagerDemo/provider/provider_main_route.dart';
import 'package:flutter_demo/stateManagerDemo/redux/redux_main_route.dart';

import '../guide/util.dart';

class StateManagerRoute extends StatelessWidget {

  const StateManagerRoute({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('状态管理Demo'),),
      body:Column(
        children: [
          createItem(context, ProviderMainRoute(), "01.provider详解"),
          createItem(context, BlocMainRoute(), "02.bloc详解"),
          createItem(context, ReduxMainRoute(), "03.redux详解"),
        ],
      ),
    );
  }
}

