import 'package:flutter/material.dart';

class GridViewTestRoute extends StatefulWidget {
  const GridViewTestRoute({Key? key}) : super(key: key);

  @override
  State<GridViewTestRoute> createState() => _GridViewTestRouteState();
}

/*
* SliverGridDelegate是一个抽象类，定义了GridView Layout相关接口，子类需要通过实现它们来
* 实现具体的布局算法。Flutter中提供了两个SliverGridDelegate的子类
* SliverGridDelegateWithFixedCrossAxisCount和SliverGridDelegateWithMaxCrossAxisExtent，我们可以直接使用。
* */
class _GridViewTestRouteState extends State<GridViewTestRoute> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("GridView使用"),
      ),
      body:
      _fixedCrossAxisCount(),
      //_maxCrossAxisCount(),
      //_count(),
      //_extent(),
    );
  }

  ///1.SliverGridDelegateWithFixedCrossAxisCount
  ///横轴为固定数量子元素的layout算法
  Widget _fixedCrossAxisCount() {
    return GridView(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        //横轴三个子Widget
        crossAxisCount: 3,
        //宽高比
        childAspectRatio: 1.0,
        //主轴方向间距
        //mainAxisSpacing:20,
        //横轴方向间距
        //crossAxisSpacing: 20,
      ),
      children: const [
        Icon(Icons.ac_unit),
        Icon(Icons.airport_shuttle),
        Icon(Icons.all_inclusive),
        Icon(Icons.beach_access),
        Icon(Icons.cake),
        Icon(Icons.free_breakfast)
      ],
    );
  }

  ///2.SliverGridDelegateWithFixedCrossAxisCount
  ///横轴子元素为固定最大长度的layout算法
  Widget _maxCrossAxisCount() {
    return GridView(
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        //子元素在横轴的最大长度
        maxCrossAxisExtent: 120,
        //宽高比
        childAspectRatio: 2.0,
        //主轴方向间距
        //mainAxisSpacing:20,
        //横轴方向间距
        //crossAxisSpacing: 20,
      ),
      children: const [
        Icon(Icons.ac_unit),
        Icon(Icons.airport_shuttle),
        Icon(Icons.all_inclusive),
        Icon(Icons.beach_access),
        Icon(Icons.cake),
        Icon(Icons.free_breakfast)
      ],
    );
  }

  ///GridView.count构造函数内部使用了SliverGridDelegateWithFixedCrossAxisCount
  Widget _count() {
    return GridView.count(
      crossAxisCount: 3,
      childAspectRatio: 1.0,
      children: const [
        Icon(Icons.ac_unit),
        Icon(Icons.airport_shuttle),
        Icon(Icons.all_inclusive),
        Icon(Icons.beach_access),
        Icon(Icons.cake),
        Icon(Icons.free_breakfast)
      ],
    );
  }

  Widget _extent(){
    return GridView.extent(
      maxCrossAxisExtent: 120,
      childAspectRatio: 2.0,
      children: const [
        Icon(Icons.ac_unit),
        Icon(Icons.airport_shuttle),
        Icon(Icons.all_inclusive),
        Icon(Icons.beach_access),
        Icon(Icons.cake),
        Icon(Icons.free_breakfast)
      ],
    );
  }
}
