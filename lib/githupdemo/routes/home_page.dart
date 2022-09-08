import 'package:flutter/material.dart';
import 'package:flutter_demo/githupdemo/common/http/git.dart';
import 'package:flutter_demo/githupdemo/common/user_model.dart';
import 'package:flutter_demo/githupdemo/widgets/home_drawer.dart';
import 'package:flutter_demo/githupdemo/widgets/repo_item.dart';
import 'package:flutter_demo/guide/05/my_drawer.dart';
import 'package:flutter_demo/l10n/localization_intl.dart';
import 'package:flutter_demo/models/index.dart';
import 'package:provider/provider.dart';

class HomeRoute extends StatefulWidget {
  const HomeRoute({Key? key}) : super(key: key);

  @override
  State<HomeRoute> createState() => _HomeRouteState();
}

class _HomeRouteState extends State<HomeRoute> {
  static const loadingTag = "##loading##";
  final _items = <Repo>[Repo()..name = loadingTag]; //构建一个Repo列表，且add name是loadingTag的Repo实例进去
  bool hasMore = true; //是否还有数据
  int page = 1; //当前请求的是第几页

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(GmLocalizations.of(context)!.home),
      ),
      body: _buildBody(), // 构建主页面
      drawer: const HomeDrawer(), //抽屉菜单
    );
  }

  _buildBody() {
    UserModel userModel = Provider.of<UserModel>(context);
    if (!userModel.isLogin) {
      //用户未登录，显示登陆按钮
      return Center(
        child: ElevatedButton(
          child: Text(GmLocalizations.of(context)!.login),
          onPressed: () => Navigator.of(context).pushNamed("login"),
        ),
      );
    } else {
      //已登录，显示项目列表
      return ListView.separated(
          itemBuilder: (BuildContext context, int index) {
            if(_items[index].name == loadingTag){
              //如果已到表尾
              if(hasMore){
                //获取数据
                _retrieveData();
                //加载时显示loading
                return Container(
                  padding: const EdgeInsets.all(16.0),
                  alignment: Alignment.center,
                  child: const SizedBox(
                    width: 24.0,
                    height: 24.0,
                    child: CircularProgressIndicator(strokeWidth: 2.0,),
                  ),
                );
              }else{
                //已经加载了100条数据
                return Container(
                  padding: const EdgeInsets.all(16.0),
                  alignment: Alignment.center,
                  child: const Text("没有更多了",style: TextStyle(color: Colors.grey),),
                );
              }
            }
            //显示单词列表项
            return RepoItem(_items[index]);
          },
          separatorBuilder: (BuildContext context, int index) => const Divider(height: .0,),
          itemCount: _items.length);
    }
  }

  void _retrieveData() async{
    var data = await Git(context).getRepos(queryParameters: {
      'page':page,
      'page_size':20,
    });
    //如果返回的数据小于指定条数，则表示没有更多数据，反之则相反
    hasMore = data.isNotEmpty && data.length %20 == 0;
    //把请求到的新数据添加到items中
    setState(() {
      _items.insertAll(_items.length-1, data);
      page++;
    });
  }


}
