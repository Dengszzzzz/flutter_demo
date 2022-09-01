

import 'package:flutter/material.dart';

class WebViewPage extends StatefulWidget {

  final data;

  WebViewPage(this.data, {Key? key}) : super(key: key);

  @override
  _WebViewPageState createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {

  bool isLoad = true;
 // FlutterWebviewPlugin? flutterWebviewPlugin;

  @override
  void initState() {
    super.initState();
   /* flutterWebviewPlugin = FlutterWebviewPlugin();
    flutterWebviewPlugin!.onStateChanged.listen((event) {
      if(event.type == WebViewState.finishLoad){
        //加载完成
        setState(() {
          isLoad = false;
        });
      }else if(event.type == WebViewState.startLoad){
        setState(() {
          isLoad = true;
        });
      }
    });*/
  }

  @override
  void dispose() {
  //  flutterWebviewPlugin?.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(widget.data['title'])),
          body:const Text("haha")
    );
    ///WebView插件
  }

}
