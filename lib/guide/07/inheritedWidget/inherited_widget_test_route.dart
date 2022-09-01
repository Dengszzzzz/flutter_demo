import 'package:flutter/material.dart';

import 'share_data_widget.dart';

///父Widget
class InheritedWidgetTestRoute extends StatefulWidget {
  const InheritedWidgetTestRoute({Key? key}) : super(key: key);

  @override
  _InheritedWidgetTestRouteState createState() =>
      _InheritedWidgetTestRouteState();
}

class _InheritedWidgetTestRouteState extends State<InheritedWidgetTestRoute> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ShareDataWidget(
        data: count,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
             const Padding(
              padding: EdgeInsets.only(bottom: 20.0),
              child: _TestWidget(),
            ),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    ++count;
                    print("count:$count");
                  });
                },
                child: const Text("Increment")),
          ],
        ),
      ),
    );
  }
}


///子树
class _TestWidget extends StatefulWidget {
  const _TestWidget({ Key? key }) : super(key: key);

  @override
  __TestWidgetState createState() => __TestWidgetState();
}

class __TestWidgetState extends State<_TestWidget> {
  //使用InheritedWidget中的共享数据
  @override
  Widget build(BuildContext context) {
    return Text(ShareDataWidget.of(context)!.data.toString());
  }

  ///一般来说，子 widget 很少会重写此方法，因为在依赖改变后 Flutter 框架
  ///也都会调用build()方法重新构建组件树。但是，如果你需要在依赖改变后执行一些昂贵的操作，
  ///比如网络请求，这时最好的方式就是在此方法中执行，这样可以避免每次build()都执行这些昂贵操作
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    //父或祖先widget中的InheritedWidget改变(updateShouldNotify返回true)时会被调用。
    //如果build中没有依赖InheritedWidget，则此回调不会被调用。
    //这种机制可以使子组件在所依赖的InheritedWidget变化时来更新自身！比如当主题、
    // locale(语言)等发生变化时，依赖其的子 widget 的didChangeDependencies方法将会被调用。
    print("Dependencies change");
  }
}
