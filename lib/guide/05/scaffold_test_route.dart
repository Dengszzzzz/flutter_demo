import 'package:flutter/material.dart';
import 'package:flutter_demo/guide/05/my_drawer.dart';

///页面骨架 Scaffold
///一个导航栏
// 导航栏右边有一个分享按钮
// 有一个抽屉菜单
// 有一个底部导航
// 右下角有一个悬浮的动作按钮
class ScaffoldTestRoute extends StatefulWidget {
  const ScaffoldTestRoute({Key? key}) : super(key: key);

  @override
  State<ScaffoldTestRoute> createState() => _ScaffoldTestRouteState();
}

class _ScaffoldTestRouteState extends State<ScaffoldTestRoute> {

  int _selectedIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("App Name"),
        actions: [
          IconButton(
              onPressed: () {
                print("icon share");
              },
              icon: const Icon(Icons.share)),
          IconButton(
              onPressed: () {
                print("icon search");
              },
              icon: const Icon(Icons.search)),
        ],
      ),
      ///抽屉
      drawer: MyDrawer(),
      ///底部导航
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home),label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.business),label: "Business"),
          BottomNavigationBarItem(icon: Icon(Icons.school),label: "School"),
        ],
        currentIndex: _selectedIndex,
        fixedColor: Colors.green,
        onTap: _onItemTapped,
      ),
      ///悬浮按钮
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: _onAdd,
      ),
    );
  }

  void _onItemTapped(int index){
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onAdd(){

  }
}
