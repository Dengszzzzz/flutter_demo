import 'package:flutter/material.dart';

///在一个页面中，同时包含多个可滚动组件，且使它们的滑动效果能统一起来
///场景：垂直方向滚动的两个ListView，第一个滚动到底部时要自动接上第二个ListView。
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
       // _buildTwoListView(),
        _buildTwoSliverList(),
    );
  }

  ///错误实例：直接在Column里，放入两个ListView
  ///结果：每个ListView各占屏幕一半，且滚动互不影响，也不联动，不符合要求
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

  ///正确实例，在CustomScrollView里，放入两个SliverList
  ///结果：第二个SliverList接在第一个后面
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
        const SliverToBoxAdapter(child: Divider(color: Colors.grey),),
        listView,
      ],
    );
  }
}
