import 'package:flutter/material.dart';

import '../07/colorAndTheme/nav_bar.dart';

///需求：页面有固定的appBar，然后垂直展示banner、tabBar、pageView，要求滚动后tabBar吸顶，listView继续滑动。
/// (Sliver组件之SliverAppBar)[https://www.jianshu.com/p/ffb9ebae3ad6]
class NestedScrollViewTestRoute2 extends StatefulWidget {
  const NestedScrollViewTestRoute2({Key? key}) : super(key: key);

  @override
  State<NestedScrollViewTestRoute2> createState() =>
      _NestedScrollViewTestRoute2State();
}

class _NestedScrollViewTestRoute2State extends State<NestedScrollViewTestRoute2>
    with SingleTickerProviderStateMixin {
  late ScrollController _scrollController;
  List tabs = ["新闻", "历史", "图片"];
  late TabController _tabController;

  //appBar默认不透明度
  double opacityAppBar = 0.0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: tabs.length, vsync: this);

    _scrollController = ScrollController();
    _scrollController.addListener(() {
      //FixMe：在这里setState()更新appBar的透明度是不合理的，因为触发全部的Widget Build了，应该通过状态管理让appBar更新才行
      //此处为了效果展示，暂不处理优化。
      print(_scrollController.offset); //打印滚动位置
      //随着向上滚动，titleBar的透明度逐渐变为1
      if (_scrollController.offset < 10) {
        //不透明度为0，就是完全不可见
        if (opacityAppBar != 0) {
          setState(() {
            opacityAppBar = 0;
          });
        }
      } else if (_scrollController.offset >= 10 &&
          _scrollController.offset < 30) {
        //不透明度为0.5
        if (opacityAppBar != 0.5) {
          setState(() {
            opacityAppBar = 0.5;
          });
        }
      } else {
        //不透明度为1
        if (opacityAppBar != 1) {
          setState(() {
            opacityAppBar = 1;
          });
        }
      }
    });
  }

  @override
  void dispose() {
    // 释放资源
    _tabController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: PreferredSize(
      //   preferredSize: Size.fromHeight(50),
      //   child: Opacity(
      //     opacity: 0,
      //     child: AppBar(
      //       title: const Text("TabBar吸顶"),
      //     ),
      //   ),
      // ),
      body: _buildTest(),
    );
  }

  /// https://blog.csdn.net/qq_20594019/article/details/129879388
  ///1、NestedScrollView + SliverAppBar + tabBar + tabBarView 实现吸顶效果
  ///问题：tabBarView中的内容顶部会被tabBar遮挡掉，用SliverOverlapAbsorber+SliverOverlapInjector处理试试。
  _buildTest() {
    return NestedScrollView(
        controller: _scrollController,
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            SliverOverlapAbsorber(
              handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
              sliver: _buildSliverAppBar(),
            )
          ];
        },
        body: _buildNestedScrollViewBody());
  }

  _buildNestedScrollViewBody() {
    return TabBarView(
      controller: _tabController,
      children: tabs.map((e) {
        ///为了使用SliverOverlapInjector，用CustomScrollView包裹Container？不合适吧！！！
        ///虽然确实能解决问题。
        return Builder(builder: (BuildContext context) {
          return CustomScrollView(
            key: PageStorageKey<String>(e),
            slivers: <Widget>[
              SliverOverlapInjector(
                handle:
                    NestedScrollView.sliverOverlapAbsorberHandleFor(context),
              ),
              SliverToBoxAdapter(
                child: Container(
                  alignment: Alignment.topCenter,
                  child: Text(e, textScaleFactor: 5),
                ),
              )
            ],
          );
        });
      }).toList(),
    );

    //return _buildTabBarView();
  }

  _buildOpacityTitle() {
    return Opacity(
      opacity: opacityAppBar,
      child: const Text("SliverAppBar"),
    );
    //return  const NavBar(color: Colors.white, title: "SliverAppBar");
  }

  _buildSliverAppBar() {
    return SliverAppBar(
      ///1、AppBar相关的东西
      //leading: Container(),
      //automaticallyImplyLeading: false,
      title: _buildOpacityTitle(),
      centerTitle:true,
      //actions: [],
      //elevation:,  //阴影
      //foregroundColor: Colors.red,  //前景色
      backgroundColor: Colors.cyanAccent,

      ///2、设置固定、漂浮、拉伸优先级
      pinned: true,
      //设置为 true，SliverAppBar 会在用户向下滚动时立即出现，而不是等到整个内容都滚动到顶部时才出现。
      floating: false,
      //这个是指appBar是否能划出屏幕外，这里并不希望显示appBar，所以设为true可移出
      snap: false,

      ///3、拉伸模式相关，设置为true，FlexibleSpaceBar的stretchModes才会生效,FlexibleSpaceBar完全展开后是否还可以继续拉伸
      // stretch: true,
      //stretchTriggerOffset: ,  //拉伸超过这个值，会回调onStretchTrigger
      //onStretchTrigger: (){
      //  print('onStretchTrigger');
      //},
      ///3、展开区域，展开高度 + 展开可折叠区域
      expandedHeight: 200.0,
      flexibleSpace: FlexibleSpaceBar(
        ///拉伸模式,如StretchMode.blurBackground 背景将模糊，StretchMode.fadeTitle 随着用户过度滚动，标题将消失。
        ///数组，可组合使用
        // stretchModes:[StretchMode.fadeTitle],
        ///折叠模式
        ///CollapseMode.parallax 有视差，视觉效果是折叠内容和bottom都滚动，但bottom滚动速度更快；
        ///pin，折叠内容后紧跟bottom，折叠到最小高度就不滚动了，可以理解作为整体滚；
        ///none，折叠内容不跟着滚动，视觉效果是bottom从下往上遮挡折叠内容，可以理解只有bottom滚遮挡。
        collapseMode: CollapseMode.pin,
        background: Container(
          height: double.infinity, //指定高度，就是展开的200最大高度
         // color: Colors.amberAccent,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: kToolbarHeight + MediaQuery.of(context).padding.top),
              Text("这是head 1111111111111111111"),
              Text("这是head 2222222222222222222"),
              Text("这是head 3333333333333333333"),
              Text("这是head 3"),
              Text("这是head 3"),
            ],
          ),
        ),
      ),

      ///设置底部，PreferredSize 此控件不对其子控件施加任何约束，并且不以任何方式影响孩子的布局
      ///AppBar.bottom通常是TabBar等，通过PreferredSize可设置为任意组件，比如这里如果用tabBar，
      ///可以不用PreferredSize包裹。
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: Container(
          color: Colors.green,
            width: double.maxFinite, //maxFinite 和 infinity有什么区别？
            child: _buildTabBar()),
      ),
    );
  }

  _buildTabBar() {
    return TabBar(
      controller: _tabController,
      tabs: tabs.map((e) {
        //这里可以是任何widget，不过Material 组件库中已经实现了一个 Tab 组件，一般使用它即可。
        //注意：Tab 的 text和child是互斥的，不能同时指定。
        return Tab(
          text: e,
        );
      }).toList(),
    );
  }

  _buildTabBarView() {
    return TabBarView(
      controller: _tabController,
      children: tabs.map((e) {
        return Container(
          alignment: Alignment.topCenter,
          child: Text(e, textScaleFactor: 5),
        );
      }).toList(),
    );
  }
}
