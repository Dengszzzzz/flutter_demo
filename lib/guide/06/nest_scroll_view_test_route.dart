import 'package:flutter/material.dart';

///CustomScrollView 只能组合 Sliver，如果有孩子也是一个可滚动组件（通过
///SliverToBoxAdapter 嵌入）且它们的滑动方向一致时便不能正常工作。为了解决这个问题，可使用 NestedScrollView
///组合（协调）两个可滚动组件
class NestScrollViewTestRoute extends StatefulWidget {
  const NestScrollViewTestRoute({Key? key}) : super(key: key);

  @override
  State<NestScrollViewTestRoute> createState() =>
      _NestScrollViewTestRouteState();
}

class _NestScrollViewTestRouteState extends State<NestScrollViewTestRoute> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("NestScrollView"),
        ),
        body:
        //_buildCustomScrollView(),
        //_nestedScrollView(),
        buildNestedScrollView2(),
    );
  }

  ///1、
  ///错误实例：CustomScrollView，包含三个ListView，两个改用SliverList，一个使用SliverToBoxAdapter包裹
  ///现象：在SliverList的显示区域滑动正常，在SliverToBoxAdapter包裹的区域滚动不会让整个页面联动
  ///
  Widget _buildCustomScrollView(){
    var listView = ListView(
      shrinkWrap: true, //wrap_content
      padding: const EdgeInsets.all(20.0),
      children: const [
        Text('I\'m dedicating every day to you'),
        Text('Domestic life was never quite my style'),
        Text('When you smile, you knock me out, I fall apart'),
        Text('And I thought I was so smart'),
      ],
    );
    var sliverListView = SliverFixedExtentList(
      itemExtent: 56, //列表项高度固定
      delegate: SliverChildBuilderDelegate(
            (_, index) => ListTile(title: Text('$index')),
        childCount: 10,
      ),
    );
    return CustomScrollView(slivers: [
      sliverListView,
      SliverToBoxAdapter(child: Divider(color: Colors.grey),),
      SliverToBoxAdapter(child: listView,),
      SliverToBoxAdapter(child: Divider(color: Colors.grey),),
      sliverListView,
    ],);
  }

  ///2、NestedScrollView + SliverAppBar
  Widget _nestedScrollView() {
    return NestedScrollView(
      //header，sliver构造器,返回一个 Sliver 数组给外部可滚动组件。
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return <Widget>[
          ///SliverAppBar，随着用户的滑动式可以收缩和展开的，可以分别指定收缩和展开的高度，
          ///pinned参数指定是否固定在顶部，
          ///floating参数为true时代表漂浮（也就是SliverAppBar可以滑出视图外），
          ///snap参数在floating为true时才会生效，设置为true代表向下滑优先展示SliverAppBar，而不用等滑倒边界。
          ///其实SliverAppBar内部包含了一个SliverPersistentHeader组件，用来实现顶部固定和漂浮效果。
          SliverAppBar(
            collapsedHeight: 60,  //收缩高度
            expandedHeight: 90,   //展开高度
            title: const Text('嵌套ListView'),
            pinned: true,  // 固定在顶部
            //floating: true,  //是否漂浮，会跟着滚动出屏幕外
            //snap: true,      //是否优先展示AppBar
            forceElevated: innerBoxIsScrolled, //导航栏下面是否一直显示阴影
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
          }, childCount: count,
        ));
  }

  ///3.NestedScrollView + CustomScrollView
  ///1) 直接就这么使用，body指定CustomScrollView包裹，那么SliverAppBar设置漂浮和优先展示情况下，
  ///   下拉，CustomScrollView不会向下滚动SliverAppBar的举例，也就是说现在展示红色绿色两个Text，
  ///   下拉后SliverAppBar直接盖住了红色Text。
  ///2）使用SliverOverlapAbsorber + SliverOverlapInjector，那么下拉后SliverAppBar的表现时不会遮住红色Text，
  ///   而是CustomScrollView知道了SliverAppBar的覆盖高度，自己往下滑动了这个举例。
  Widget buildNestedScrollView2(){
    final _tabs = ['猜你喜欢', '今日特价', '发现更多'];
    return DefaultTabController(
        length: _tabs.length,
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return [
              SliverOverlapAbsorber(
                handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                sliver: SliverAppBar(
                  title: const Text('商城'),
                  floating: true,
                  snap: true,
                  forceElevated: innerBoxIsScrolled,
                  bottom: TabBar(
                    tabs: _tabs.map((String name) => Tab(text: name)).toList(),
                  ),
                ),
              ),
            ];
          },
          body: TabBarView(
            children: _tabs.map((String name){
              return Builder(builder: (BuildContext context){
                ///NestScrollView包裹CustomScrollView时，直接使用会出现滑动的时候
                ///SliverAppBar遮挡CustomScrollView的列表内容。
                ///可以使用 SliverOverlapAbsorber 包裹 SliverAppBar，同时给 CustomScrollView 添加一个SliverOverlapInjector。
                ///SliverOverlapAbsorber：获取 SliverAppBar 返回时遮住内部可滚动组件的部分的长度，这个长度就是 overlap（重叠） 的长度。
                ///SliverOverlapInjector：它会将 SliverOverlapAbsorber 中获取的overlap 长度应用到内部可滚动组件中。
                ///SliverOverlapAbsorber 和 SliverOverlapInjector都要传入handle，
                return CustomScrollView(
                  key: PageStorageKey<String>(name),
                  slivers: <Widget>[
                    SliverOverlapInjector(
                      handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                    ),
                    SliverPadding(
                      padding: const EdgeInsets.all(8.0),
                      sliver: buildSliverList(50),
                    ),
                  ],
                );
              });
            }
            ).toList(),
          ),
        ));
  }
}
