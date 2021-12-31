
import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class WebViewPage extends StatefulWidget {

  final data;

  WebViewPage(this.data, {Key? key}) : super(key: key);

  @override
  _WebViewPageState createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {

  bool isLoad = true;
  FlutterWebviewPlugin? flutterWebviewPlugin;

  @override
  void initState() {
    super.initState();
    flutterWebviewPlugin = FlutterWebviewPlugin();
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
    });
  }

  @override
  void dispose() {
    flutterWebviewPlugin?.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    ///WebView插件
    return WebviewScaffold(
      appBar: AppBar(title: Text(widget.data['title']),
        ///appbar下边摆放一个进度条
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(1.0),
          child: LinearProgressIndicator(),
        ),
        ///透明度
        bottomOpacity: isLoad? 1.0:0.0,
      ),
      withLocalStorage: true,  //缓存，数据存储
      url: widget.data['url'],
      withJavascript: true,
    );
  }

}
