import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

///模拟请求数据更新item，底部显示loading和已到底视图。
class InfiniteListViewTestRoute extends StatefulWidget {
  const InfiniteListViewTestRoute({Key? key}) : super(key: key);

  @override
  State<InfiniteListViewTestRoute> createState() =>
      _InfiniteListViewTestRouteState();
}

class _InfiniteListViewTestRouteState extends State<InfiniteListViewTestRoute> {
  static const loadingTag = "##loading##"; //表尾标记
  var _words = <String>[loadingTag];

  @override
  void initState() {
    _retrieveData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ListView实例"),
      ),
      body: ListView.separated(
          itemCount: _words.length,
          itemBuilder: (context, index) {
            if (_words[index] == loadingTag) {
              //已到表尾，且不足100条数据，去获取数据，此时显示进度圈
              if (_words.length - 1 < 100) {
                _retrieveData();
                return Container(
                  padding: const EdgeInsets.all(16.0),
                  alignment: Alignment.center,
                  child: const SizedBox(
                    width: 24.0,
                    height: 24.0,
                    child: CircularProgressIndicator(
                      strokeWidth: 2.0,
                    ),
                  ),
                );
              } else {
                //已经加载100条数据，不再获取数据
                return Container(
                  padding: const EdgeInsets.all(16.0),
                  alignment: Alignment.center,
                  child: const Text(
                    "没有更多了",
                    style: TextStyle(color: Colors.grey),
                  ),
                );
              }
            } else {
              //未到表尾，显示item
              return ListTile(
                title: Text(_words[index]),
              );
            }
          },
          separatorBuilder: (context, index) {
            return const Divider(
              height: .0,
            );
          }),
    );
  }

  void _retrieveData() {
    Future.delayed(const Duration(seconds: 2)).then((value) {
      setState(() {
        _words.insertAll(
          _words.length - 1,
          //每次生成20个单词
          generateWordPairs().take(20).map((e) => e.asPascalCase).toList(),
        );
      });
    });
  }
}
