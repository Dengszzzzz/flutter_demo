

import 'package:dio/dio.dart';

import 'api.dart';

class HttpManager{
  late Dio _dio;


  // 单例模式
  static final HttpManager _instance = HttpManager._internal();
  factory HttpManager() => _instance;
  HttpManager._internal(){
    init();
  }

  init(){
    BaseOptions options = BaseOptions(
      baseUrl: Api.baseUrl,
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 3),
    );
    _dio = Dio(options);
  }

  //todo：为什么没有定义方法类型
   request(url,{String method="get"}) async{
    try{
      Options options = new Options(method: method);
      Response response = await _dio.request(url,options: options);
      return response.data;
    }catch(e){
      return null;
    }
  }

}