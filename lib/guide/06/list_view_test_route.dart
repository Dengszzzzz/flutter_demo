import 'package:flutter/material.dart';

///1、直接用构造函数，指定children，适用于少数据多样式列表。
///2、ListView.builder、ListView.separated，指定itemBuilder，适用于多数据列表。
///   可以指定itemExtent指定高度，也可以prototypeItem让系统自己去根据这个itemWidget测量高度。
///3、
class ListViewTestRoute extends StatefulWidget {
  const ListViewTestRoute({Key? key}) : super(key: key);

  @override
  State<ListViewTestRoute> createState() => _ListViewTestRouteState();
}

class _ListViewTestRouteState extends State<ListViewTestRoute> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ListView实例"),
      ),
      body:
      //_listView(),
       // _listViewBuilder(),
       // _listViewSeparated(),
        _head(),
    );
  }

  ///1.直接使用构造函数
  Widget _listView() {
    return ListView(
      shrinkWrap: true, //wrap_content
      padding: const EdgeInsets.all(20.0),
      children: const [
        Text('I\'m dedicating every day to you'),
        Text('Domestic life was never quite my style'),
        Text('When you smile, you knock me out, I fall apart'),
        Text('And I thought I was so smart'),
      ],
    );
  }

  ///2.ListView.builder
  Widget _listViewBuilder() {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        return DecoratedBox(
          decoration: BoxDecoration(
            color: index % 2 == 0 ? Colors.red : Colors.blue,
          ),
          child: ListTile(
            title: Text("$index"),
          ),
        );
      },
      itemCount: 100,
      //指定高度，itemExtent是像素，用prototypeItem更好
      itemExtent: 80.0, //强制高度为50.0
      //prototypeItem: const ListTile(title: Text("1"),),
    );
  }

  ///3.ListView.separated
  Widget _listViewSeparated() {
    //下划线widget预定义以供复用。
    Widget divider1 = Divider(
      color: Colors.blue,
    );
    Widget divider2 = Divider(color: Colors.green);
    return ListView.separated(
      itemCount: 100,
      //列表项构造器
      itemBuilder: (BuildContext context, int index) {
        return ListTile(title: Text("$index"));
      },
      //分割器构造器
      separatorBuilder: (BuildContext context, int index) {
        return index % 2 == 0 ? divider1 : divider2;
      },
    );
  }

  ///4.添加固定列表头
  Widget _head() {
    return Column(
      children: [
        const ListTile(
          title: Text("商品列表"),
        ),
        //可能会想着竖直列表，ListTile占一份，剩下的空间是ListView，然而此时 ListView高度边界无法确定。
        //可以用任何容器组件包裹，设置高度。此处用Expanded获取最大高度合适。
        //  ListView.builder(
        //    itemBuilder: (context,index){
        //      return ListTile(title: Text("$index"),);
        //    },
        //   // shrinkWrap: true,  //加了这句直接卡死  https://zhuanlan.zhihu.com/p/644312619
        //  )
        Expanded(child: ListView.builder(itemBuilder: (context, index) {
          return ListTile(
            title: Text("$index"),
          );
        }))
      ],
    );
  }
}
