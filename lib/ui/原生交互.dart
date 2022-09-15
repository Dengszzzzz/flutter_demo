

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_demo/ui/my_flutter_plugin.dart';

void main() => runApp(const FlutterPluginTest());

class FlutterPluginTest extends StatefulWidget {
  const FlutterPluginTest({Key? key}) : super(key: key);

  @override
  State<FlutterPluginTest> createState() => _FlutterPluginTestState();
}

class _FlutterPluginTestState extends State<FlutterPluginTest> {

  String? version = "Version：";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("原生交互"),),
        body: Column(
          children: [
            Text(version??"啦啦啦"),
            ElevatedButton(onPressed: (){
              _handleNativeMethod();
            }, child: const Text("调用Native方法获取version"))
          ],
        ),
      ),
    );
  }

  Future<void> _handleNativeMethod() async{
    try{
      version = await MyFlutterPlugin.platformVersion ?? "Unknown platform version";
      print(version);
    } on PlatformException{
      version = "Failed to get platform version.";
    } finally{
      setState(() {

      });
    }
  }
}



