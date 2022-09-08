
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';

///HttpClient发起HTTP请求
///httpClient配置、Http请求认证、代理、证书校验
class HttpClientTestRoute extends StatefulWidget {
  const HttpClientTestRoute({Key? key}) : super(key: key);

  @override
  State<HttpClientTestRoute> createState() => _HttpClientTestRouteState();
}

class _HttpClientTestRouteState extends State<HttpClientTestRoute> {

  bool _loading = false;
  String _text = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("HttpClient"),),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ElevatedButton(onPressed: (){
              _loading? null:request;
            }, child: Text("获取百度首页"),),
            Container(
              width: MediaQuery.of(context).size.width - 50.0,
              child: Text(_text.replaceAll(RegExp(r"\s"), "")),
            )
          ],
        ),
      ),
    );
  }

  request() async{
    setState(() {
      _loading = true;
      _text = "正在请求...";
    });
    try{
      //1.创建一个HttpClient
      HttpClient httpClient = HttpClient();
      //2.打开Http连接
      HttpClientRequest request = await httpClient.getUrl(Uri.parse("https://www.baidu.com"));
      //使用iPhone的UA
      request.headers.add(
        "user-agent",
        "Mozilla/5.0 (iPhone; CPU iPhone OS 10_3_1 like Mac OS X) AppleWebKit/603.1.30 (KHTML, like Gecko) Version/10.0 Mobile/14E304 Safari/602.1",
      );
      //3.等待连接服务器
      HttpClientResponse response = await request.close();
      //4.读取响应内容
      _text = await response.transform(utf8.decoder).join();
      //输出响应头
      print(response.headers);

      //5.关闭client后，通过该client发起的所有请求都会终止
      httpClient.close();
    }catch(e){
      _text = "请求失败：$e";
    }finally{
      setState(() {
        _loading = false;
      });
    }
  }

}
