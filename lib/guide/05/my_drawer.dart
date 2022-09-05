import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: MediaQuery.removePadding(
        context: context,
        //移除抽屉菜单顶部默认留白
        removeTop: true,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 38.0),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: ClipOval(
                      child: Image.asset(
                        "images/ic_no_data.png",
                        width: 80,
                      ),
                    ),
                  ),
                  const Text(
                    "Wendux",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            Expanded(child: ListView(
              children: [
                ListTile(
                  leading: Icon(Icons.add),
                  title: Text('Add account'),
                  onTap:(){
                    print('Drawer Add account');
                  },
                ),
                ListTile(
                  leading: Icon(Icons.settings),
                  title: Text('Manage accounts'),
                  onTap:(){
                    print('Drawer Manage accounts');
                  },
                ),
              ],
            ))
          ],
        ),
      ),
    );
  }
}
