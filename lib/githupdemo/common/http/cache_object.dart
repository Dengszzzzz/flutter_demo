import 'dart:collection';
import 'dart:ffi';

import 'package:dio/dio.dart';
import 'package:flutter_demo/githupdemo/common/global.dart';

class CacheObject {
  CacheObject(this.response)
      : timeStamp = DateTime.now().millisecondsSinceEpoch;

  Response response;
  int timeStamp; //缓存时间

  //operator是Dart的一个关键字，它和运算符（如=）一起使用，表示一个运算符重载函数
  @override
  bool operator ==(other) {
    return response.hashCode == other.hashCode;
  }

  //将请求uri作为缓存的key
  @override
  int get hashCode => response.realUri.hashCode;
}

class NetCache extends Interceptor {
  //为确保迭代器顺序和对象插入时间一致顺序一致，我们使用LinkedHashMap
  var cache = LinkedHashMap<String, CacheObject>();

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (!Global.profile.cache!.enable) {
      return handler.next(options);
    }
    //refresh标记是否是“下拉刷新”
    bool refresh = options.extra["refresh"] == true;
    if (refresh) {
      if (options.extra["list"] == true) {
        //若是列表，则只要url中包含当前path的缓存全部删除
        cache.removeWhere((key, value) => key.contains(options.path));
      } else {
        //如果不是列表，则只删除uri相同的缓存
        delete(options.uri.toString());
      }
      return handler.next(options);
    }
    if (options.extra["noCache"] != true &&
        options.method.toLowerCase() == 'get') {
      //get方法才会缓存
      String key = options.extra["cacheKey"] ?? options.uri.toString();
      var ob = cache[key];
      if(ob != null){
        //若缓存未过期，则返回缓存内容
        if((DateTime.now().millisecondsSinceEpoch - ob.timeStamp)/1000 < Global.profile.cache!.maxAge){
          return handler.resolve(ob.response);
        }else{
          //若已过期则删除缓存，继续向服务器请求
          cache.remove(key);
        }
      }
    }
    handler.next(options);
  }


  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    //如果启用缓存，将返回结果保存到缓存
    if(Global.profile.cache!.enable){
      _saveCache(response);
    }
    handler.next(response);
  }

  _saveCache(Response response){
    RequestOptions options = response.requestOptions;
    if(options.extra["noCache"] != true && options.method.toLowerCase() == "get"){
      //如果缓存数量超过最大数量限制，则先移除最早的一条记录
      if(cache.length == Global.profile.cache!.maxCount){
        cache.remove(cache[cache.keys.first]);
      }
      String key = options.extra["cacheKey"] ?? options.uri.toString();
      cache[key] = CacheObject(response);
    }
  }

  void delete(String key){
    cache.remove(key);
  }
}
