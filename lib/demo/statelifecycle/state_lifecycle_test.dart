import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'count_widget.dart';


void main() => runApp(StateLifecycleTest());

class StateLifecycleTest extends StatelessWidget {
  const StateLifecycleTest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("生命周期演示"),
        ),
        body: CounterWidget(),
      ),
    );
  }
}