import 'package:flutter/material.dart';

///在一个页面中，同时包含多个可滚动组件，且使它们的滑动效果能统一起来
class CustomScrollViewTestRoute extends StatefulWidget {
  const CustomScrollViewTestRoute({Key? key}) : super(key: key);

  @override
  State<CustomScrollViewTestRoute> createState() =>
      _CustomScrollViewTestRouteState();
}

class _CustomScrollViewTestRouteState extends State<CustomScrollViewTestRoute> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("CustomScrollView"),
        ),
        body:
        //_buildTwoListView(),
       // _buildTwoSliverList(),
        _nestedScrollView(),
    );

    return Material(
      child: _nestedScrollView(),
    );
  }

  Widget _buildTwoListView() {
    var listView = ListView.builder(
      itemCount: 20,
      itemBuilder: (_, index) => ListTile(title: Text('$index')),
    );
    return Column(
      children: [
        Expanded(child: listView),
        const Divider(color: Colors.grey),
        Expanded(child: listView),
      ],
    );
  }

  Widget _buildTwoSliverList() {
    // SliverFixedExtentList 是一个 Sliver，它可以生成高度相同的列表项。
    // 再次提醒，如果列表项高度相同，我们应该优先使用SliverFixedExtentList
    // 和 SliverPrototypeExtentList，如果不同，使用 SliverList.
    var listView = SliverFixedExtentList(
      itemExtent: 56, //列表项高度固定
      delegate: SliverChildBuilderDelegate(
            (_, index) => ListTile(title: Text('$index')),
        childCount: 10,
      ),
    );
    // 使用
    return CustomScrollView(
      slivers: [
        //必须是sliver组件，如果是box组件，可以用SliverToBoxAdapter转换
        listView,
        listView,
      ],
    );
  }

  // CustomScrollView 只能组合 Sliver，如果有孩子也是一个可滚动组件（通过
// SliverToBoxAdapter 嵌入）且它们的滑动方向一致时便不能正常工作。为了解决这个问题，
// Flutter 中提供了一个NestedScrollView 组件，它的功能时组合（协调）两个可滚动组件.
  Widget _nestedScrollView() {
    return NestedScrollView(
      //header，sliver构造器,返回一个 Sliver 数组给外部可滚动组件。
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return <Widget>[
          SliverAppBar(
            title: const Text('嵌套ListView'),
            pinned: true, // 固定在顶部
            forceElevated: innerBoxIsScrolled,
          ),
          buildSliverList(5), //构建一个 sliverList
        ];
      },
      body: ListView.builder(
        padding: const EdgeInsets.all(8),
        physics: const ClampingScrollPhysics(), //重要
        itemCount: 30,
        itemBuilder: (BuildContext context, int index) {
          return SizedBox(
            height: 50,
            child: Center(child: Text('Item $index')),
          );
        },
      ),
    );
  }

  Widget buildSliverList(count) {
    return SliverFixedExtentList(
        itemExtent: 56, //列表项高度固定
        delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
            return ListTile(title: Text('$index'));
          }, childCount: 5,
        ));
  }
}
