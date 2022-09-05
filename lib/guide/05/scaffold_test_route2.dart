import 'package:flutter/material.dart';
import 'package:flutter_demo/guide/05/my_drawer.dart';

///页面骨架 Scaffold
class ScaffoldTestRoute2 extends StatefulWidget {
  const ScaffoldTestRoute2({Key? key}) : super(key: key);

  @override
  State<ScaffoldTestRoute2> createState() => _ScaffoldTestRoute2State();
}

class _ScaffoldTestRoute2State extends State<ScaffoldTestRoute2> {

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
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        //底部导航栏打一个圆形的洞,shape决定外形
        shape: CircularNotchedRectangle(),
        child: Row(
          children: [
            IconButton(onPressed: (){}, icon: Icon(Icons.home)),
            SizedBox(), //中间位置空出
            IconButton(onPressed: (){}, icon: Icon(Icons.business)),
          ],
          mainAxisAlignment: MainAxisAlignment.spaceAround, //均分底部导航栏横向空间
        ),
      ),
      //上面代码没有打洞位置，实际上是取决于 floatingActionButtonLocation
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
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
