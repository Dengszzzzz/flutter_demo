import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class DioTestRoute extends StatefulWidget {
  const DioTestRoute({Key? key}) : super(key: key);

  @override
  State<DioTestRoute> createState() => _DioTestRouteState();
}

class _DioTestRouteState extends State<DioTestRoute> {

  Dio _dio = Dio();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Dio"),),
      body:Container(
        alignment: Alignment.center,
        child: FutureBuilder(
          future: _dio.get("https://api.github.com/orgs/flutterchina/repos"),
          builder:(BuildContext context, AsyncSnapshot snapshot){
            if(snapshot.connectionState == ConnectionState.done){
              //请求完成
              if(snapshot.hasError){
                //发送错误
                return Text(snapshot.error.toString());
              }
              //请求成功，通过项目信息构建用于显示项目名称的ListView
              Response response = snapshot.data;
              return ListView(
                children: response.data.map<Widget>((e)=>ListTile(title: Text(e["full_name"]),)).toList(),
              );
            }
            //请求未完成时弹出loading
            return CircularProgressIndicator();
          } ,
        ),
      ),
    );
  }
}
