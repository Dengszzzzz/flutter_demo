import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/guide/07/dialog/dialog_check_box.dart';

class AlertDialogTestRoute extends StatefulWidget {
  const AlertDialogTestRoute({Key? key}) : super(key: key);

  @override
  State<AlertDialogTestRoute> createState() => _AlertDialogTestRouteState();
}

class _AlertDialogTestRouteState extends State<AlertDialogTestRoute> {
  @override
  Widget build(BuildContext context) {
    print("build");
    return Column(
      children: [
        ElevatedButton(
            onPressed: () async {
              //弹出对话框等待其关闭,返回值用Future包裹，使用async 、 await搭配使用。
              bool? delete = await showDeleteConfirmDialog1();
              if (delete == null) {
                print("取消删除");
              } else {
                print("已确认删除");
              }
            },
            child: Text("对话框1")),
        ElevatedButton(onPressed: () => changeLanguage(), child: Text("对话框2")),
        ElevatedButton(onPressed: () => showListDialog(), child: Text("对话框3")),
        ElevatedButton(
            onPressed: () => showDeleteConfirmDialog2(), child: Text("对话框4")),
        ElevatedButton(
          child: Text("显示底部菜单列表"),
          onPressed: () async {
            int? type = await _showModalBottomSheet();
            print(type);
          },
        ),
        ElevatedButton(
            onPressed: () => showLoadingDialog(), child: Text("加载框")),
        ElevatedButton(
            onPressed: () => _showDatePicker1(), child: Text("Android 日历")),
        ElevatedButton(
            onPressed: () => _showDatePicker2(), child: Text("iOS 日历")),
      ],
    );
  }

  //弹出对话框
  Future<bool?> showDeleteConfirmDialog1() {
    return showDialog(
        context: context,
        builder: (context) {
          //简单的弹窗实例
          return AlertDialog(
            title: Text("提示"),
            content: Text("您确定要删除当前文件吗？"),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: Text("取消"),
              ),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(true);
                  },
                  child: Text("删除"))
            ],
          );
        });
  }

  ///SimpleDialog
  ///SimpleDialog也是Material组件库提供的对话框，它会展示一个列表，用于列表选择的场景
  Future<void> changeLanguage() async {
    int? i = await showDialog(
        context: context,
        builder: (context) {
          return SimpleDialog(
            title: Text("请选择语言"),
            children: [
              SimpleDialogOption(
                onPressed: () => Navigator.pop(context, 1),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 6),
                  child: Text("中文简体"),
                ),
              ),
              SimpleDialogOption(
                onPressed: () => Navigator.pop(context, 2),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 6),
                  child: Text("美国英语"),
                ),
              )
            ],
          );
        });
    if (i != null) {
      print("选择了：${i == 1 ? "中文简体" : "美国英语"}");
    }
  }

  ///实际上AlertDialog和SimpleDialog都使用了Dialog类。由于AlertDialog和SimpleDialog
  ///中使用了IntrinsicWidth来尝试通过子组件的实际尺寸来调整自身尺寸，这就导致他们的子组件不
  ///能是延迟加载模型的组件（如ListView、GridView 、 CustomScrollView等）
  /// 如果要嵌套ListView这些组件时，直接使用Dialog类

  Future<void> showListDialog() async {
    int? index = await showDialog<int>(
      context: context,
      builder: (BuildContext context) {
        var child = Column(
          children: [
            ListTile(
              title: Text("请选择"),
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: 30,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      title: Text("$index"),
                      onTap: () => Navigator.of(context).pop(index),
                    );
                  }),
            ),
          ],
        );
        //使用AlertDialog会报错
        return AlertDialog(content: child);
        //return Dialog(child: child);
      },
    );
    if (index != null) {
      print("点击了：$index");
    }
  }

  ///对话框状态管理
  bool withTree = false; // 复选框选中状态
  Future<bool?> showDeleteConfirmDialog2() {
    withTree = false; // 默认复选框不选中
    return showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("提示"),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text("您确定要删除当前文件吗?"),
              Row(
                children: <Widget>[
                  Text("同时删除子目录？"),

                  /// 方法一：不可行
                  /// setState方法只会针对当前context的子树重新build，但是我们的对话框并
                  /// 不是在_DialogRouteState的build 方法中构建的，而是通过showDialog单独构建，
                  /// 所以在_DialogRouteState的context中调用setState是无法影响通过showDialog构建的UI的。
                  ///
                  /*
                      Checkbox(
                      value: withTree,
                      onChanged: (bool? value) {
                      setState(() {
                      withTree = !withTree;
                      });
                      },
                      ),*/

                  /// 方法二：可行，但麻烦，对话框所有可能会改变状态的组件都得单独封装在一个内部管理状态的StatefulWidget中。
                  /*DialogCheckBox(value: withTree, onChanged: (bool? value) {
                    withTree = !withTree;
                  }),*/

                  ///方法三：在部单独抽离组件的情况下创建一个StatefulWidget上下文。
                  /*StatefulBuilder(builder: (BuildContext context, StateSetter _setState){
                    return Checkbox(
                        value: withTree,
                        onChanged: (bool? value){
                          _setState((){
                            withTree = !withTree;
                          });
                        });
                  }),*/

                  ///方法四： (context as Element).markNeedsBuild(); 把Checkbox的Element标记为dirty
                  ///为了缩小范围采用Builder包裹，如果不用，则是整个dialog内的组件都刷新了
                  Builder(builder: (context) {
                    return Checkbox(
                      value: withTree,
                      onChanged: (bool? value) {
                        (context as Element).markNeedsBuild();
                        withTree = !withTree;
                      },
                    );
                  }),
                ],
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              child: Text("取消"),
              onPressed: () => Navigator.of(context).pop(),
            ),
            TextButton(
              child: Text("删除"),
              onPressed: () {
                //执行删除操作
                Navigator.of(context).pop(withTree);
              },
            ),
          ],
        );
      },
    );
  }


  // 弹出底部菜单列表模态对话框
  Future<int?> _showModalBottomSheet() {
    return showModalBottomSheet<int>(
      context: context,
      builder: (BuildContext context) {
        return ListView.builder(
          itemCount: 30,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: Text("$index"),
              onTap: () => Navigator.of(context).pop(index),
            );
          },
        );
      },
    );
  }

  ///Loading框
  showLoadingDialog() {
    showDialog(
      context: context,
      barrierDismissible: false, //点击遮罩不关闭对话框
      builder: (context) {
        /*return AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              CircularProgressIndicator(),
              Padding(
                padding: const EdgeInsets.only(top: 26.0),
                child: Text("正在加载，请稍后..."),
              )
            ],
          ),
        );*/

        ///showDialog中已经给对话框设置了最小宽度约束，要调整宽度，
        ///可使用UnconstrainedBox先抵消showDialog对宽度的约束,再用SizeBox或ConstrainedBox来设定宽度。
        return UnconstrainedBox(
          constrainedAxis: Axis.vertical,
          child: SizedBox(
            width: 280,
            child: AlertDialog(
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircularProgressIndicator(value: .8,),
                  Padding(padding: EdgeInsets.only(top: 26.0),
                    child: Text("正在加载，请稍后。。。"),)
                ],
              ),
            ),
          ),
        );
      },
    );
  }


  ///日历选择
  Future<DateTime?> _showDatePicker1() {
    var date = DateTime.now();
    return showDatePicker(
      context: context,
      initialDate: date,
      firstDate: date,
      lastDate: date.add( //未来30天可选
        Duration(days: 30),
      ),
    );
  }

  Future<DateTime?> _showDatePicker2() {
    var date = DateTime.now();
    return showCupertinoModalPopup(
      context: context,
      builder: (ctx) {
        return SizedBox(
          height: 200,
          child: CupertinoDatePicker(
            mode: CupertinoDatePickerMode.dateAndTime,
            minimumDate: date,
            maximumDate: date.add(
              Duration(days: 30),
            ),
            maximumYear: date.year + 1,
            onDateTimeChanged: (DateTime value) {
              print(value);
            },
          ),
        );
      },
    );
  }
}
