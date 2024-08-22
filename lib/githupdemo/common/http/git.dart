import 'dart:convert';
import 'dart:ffi';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/githupdemo/common/global.dart';
import 'package:flutter_demo/models/index.dart';
import 'package:flutter_demo/models/user.dart';

///一个完整的APP，可能会涉及很多网络请求，为了便于管理、收敛请求入口，工程上最好的作法就是
///将所有网络请求放到同一个源码文件中。由于我们的接口都是请求的Github 开发平台提供的API，
///所以我们定义一个Git类，专门用于Github API接口调用。另外，在调试过程中，我们通常需要一
///些工具来查看网络请求、响应报文，使用网络代理工具来调试网络数据问题是主流方式。配置代理需
///要在应用中指定代理服务器的地址和端口，另外Github API是HTTPS协议，所以在配置完代理后还
///应该禁用证书校验，这些配置我们在Git类初始化时执行（init()方法）。
class Git {
  //网络请求过程中可能会需要使用当前context信息，比如在请求失败时打开一个新路由，而打开新路由需要context信息。
  Git([this.context]) {
    _options = Options(extra: {"context": context});
  }

  BuildContext? context;
  late Options _options;

  static Dio dio =
      Dio(BaseOptions(baseUrl: 'https://api.github.com/', headers: {
    HttpHeaders.acceptHeader:
        "application/vnd.github.squirrel-girl-preview,application/vnd.github.symmetra-preview+json",
  }));

  static void init() {
    //添加缓存插件
    dio.interceptors.add(Global.netCache);

    //设置用户token，可能为null，代表未登录
    dio.options.headers[HttpHeaders.authorizationHeader] = Global.profile.token;

    //在调试模式下需要抓包调试，所以使用代理，并禁用Https证书校验
    if (!Global.isRelease) {
      dio.httpClientAdapter = IOHttpClientAdapter(
        createHttpClient: () {
          final client = HttpClient();
          //1.代理
          // client.findProxy = (uri) {
          //   // 将请求代理至 localhost:8888。
          //   // 请注意，代理会在你正在运行应用的设备上生效，而不是在宿主平台生效。
          //   return 'PROXY localhost:8888';
          // };

          //2.HTTPS 证书校验
          //代理工具会提供一个抓包的自签名证书，会通不过证书校验，所以禁用证书校验
          client.badCertificateCallback = (cert, host, port) => true;
          return client;
        }
      );
    }
  }

  //登录接口，登录成功后返回用户信息
  Future<User> login(String login, String pwd) async {
    String basic = 'Basic ' + base64.encode(utf8.encode('$login:$pwd'));
    var r = await dio.get("/user",
        options: _options.copyWith(
          headers: {HttpHeaders.authorizationHeader:basic},
          extra: {"noCache":true,}  //本接口禁用缓存
        ),
    );
    //登录成功后更新公共头(authorization)，此后的所有请求都会带上用户身份信息
    dio.options.headers[HttpHeaders.authorizationHeader] = basic;
    //清空所有缓存
    Global.netCache.cache.clear();
    //更新Profile中的token信息
    Global.profile.token = basic;
    print(r);
    return User.fromJson(r.data);
  }

  //获取用户项目列表
  Future<List<Repo>> getRepos({
    Map<String,dynamic>? queryParameters, //query参数，用于接收分页信息
    refresh = false,
  }) async{
    if(refresh){
      //下拉刷新，需要删除缓存（拦截器中会读取这些信息）
      _options.extra!.addAll({"refresh":true,"list":true});
    }
    var r = await dio.get<List>("user/repos",queryParameters: queryParameters,options: _options);
    print(r);
    return r.data!.map((e) => Repo.fromJson(e)).toList();
  }
}
