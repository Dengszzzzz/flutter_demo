
import 'package:flutter_demo/ui/http/http_manager.dart';

class Api{
  static const String baseUrl = "http://www.wanandroid.com/";

  //首页文章列表 http://www.wanandroid.com/article/list/0/json
  static const String ARTICLE_LIST = "article/list/";

  static const String BANNER = "banner/jsons";

  //todo：为什么要加 async？  async可以理解为异步
  static getArticleList(int page) async {
    return HttpManager().request('$ARTICLE_LIST$page/jsons');
  }

  static getBanner() async {
    return await HttpManager().request(BANNER);
  }

}