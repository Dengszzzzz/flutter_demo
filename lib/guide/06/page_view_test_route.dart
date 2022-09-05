
import 'package:flutter/material.dart';

///类似Android ViewPager
class PageViewTestRoute extends StatefulWidget {
  const PageViewTestRoute({Key? key}) : super(key: key);

  @override
  State<PageViewTestRoute> createState() => _PageViewTestRouteState();
}

class _PageViewTestRouteState extends State<PageViewTestRoute> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("PageView使用"),),
      body:
      _normal(),
    );
  }

  /*
  * PageView 默认并没有缓存功能，一旦页面滑出屏幕它就会被销毁，这和我们前面讲过的
  * ListView/GridView 不一样，在创建 ListView/GridView 时我们可以手动指定 ViewPort
  * 之外多大范围内的组件需要预渲染和缓存（通过 cacheExtent 指定），只有当组件滑出屏幕后
  * 又滑出预渲染区域，组件才会被销毁
  *
  * */
  Widget _normal(){
    var children = <Widget>[];
    // 生成 6 个 Tab 页
    for (int i = 0; i < 6; ++i) {
      children.add( Page2( text: '$i'));
    }
    return PageView(
      //设置这个为true，cacheExtent 为 1.0，则代表前后各缓存一个页面宽度，即前后各一页
     // allowImplicitScrolling: true,  //但不推荐这样的做法
      // scrollDirection: Axis.vertical, // 滑动方向为垂直方向
      children: children,
    );
  }
}

class Page extends StatefulWidget {
  const Page({Key? key, required this.text}) : super(key: key);

  final String text;

  @override
  State<Page> createState() => _PageState();
}

class _PageState extends State<Page> {
  @override
  Widget build(BuildContext context) {
    print("build ${widget.text}");
    return Center(child: Text("${widget.text}", textScaleFactor: 5));
  }
}

///AutomaticKeepAlive
///AutomaticKeepAlive 的组件的主要作用是将列表项的根 RenderObject 的 keepAlive
///按需自动标记 为 true 或 false。为了方便叙述，我们可以认为根 RenderObject
///对应的组件就是列表项的根 Widget，代表整个列表项组件，同时我们将列表组件的 Viewport区域
///+ cacheExtent（预渲染区域）称为加载区域 ：
/*
* 1)当 keepAlive 标记为 false 时，如果列表项滑出加载区域时，列表组件将会被销毁。
* 2)当 keepAlive 标记为 true 时，当列表项滑出加载区域后，Viewport 会将列表组件缓存起来；
*   当列表项进入加载区域时，Viewport 从先从缓存中查找是否已经缓存，如果有则直接复用，如果没有则重新创建列表项。
* */
class Page2 extends StatefulWidget {
  const Page2({Key? key, required this.text}) : super(key: key);

  final String text;

  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> with AutomaticKeepAliveClientMixin {

  @override
  Widget build(BuildContext context) {
    // 必须调用,super.build(context)，该方法实现在
    // AutomaticKeepAliveClientMixin 中，功能就是根据当前 wantKeepAlive 的值给
    // AutomaticKeepAlive 发送消息，AutomaticKeepAlive 收到消息后就会开始工作
    super.build(context);
    print("build ${widget.text}");
    return Center(child: Text("${widget.text}", textScaleFactor: 5));
  }

  // 是否需要缓存
  @override
  bool get wantKeepAlive => true;
}