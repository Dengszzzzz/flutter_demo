import 'package:flutter/material.dart';

//https://book.flutterchina.club/chapter3/input_and_form.html#_3-5-1-textfield

class TextFieldAndFormTestRoute extends StatefulWidget {
  const TextFieldAndFormTestRoute({Key? key}) : super(key: key);

  @override
  State<TextFieldAndFormTestRoute> createState() =>
      _TextFieldAndFormTestRouteState();
}

class _TextFieldAndFormTestRouteState extends State<TextFieldAndFormTestRoute> {
  //获取输入内容
  //1.controller获取。
  //2.onChange触发。
  //两种方式相比，onChanged是专门用于监听文本变化，而controller的功能却多一些， 除了能监听文本变化外，它还可以设置默认值、选择文本
  TextEditingController _unameController = TextEditingController();

  //控制焦点
  //焦点可以通过FocusNode和FocusScopeNode来控制，默认情况下，焦点由FocusScope来管理，
  // 它代表焦点控制范围，可以在这个范围内可以通过FocusScopeNode在输入框之间移动焦点、
  // 设置默认焦点等。我们可以通过FocusScope.of(context) 来获取Widget树中默认的FocusScopeNode。
  FocusNode focusNode1 = FocusNode();
  FocusNode focusNode2 = FocusNode();
  FocusScopeNode? focusScopeNode;

  @override
  void initState() {
    //设置controller监听，设置默认值，并从第三个字符开始选中后面的字符
    // ".."操作符用于链接多个方法调用，使得多个方法可以在同一个对象上调用
    _unameController
      ..addListener(() {
        print("controller信息：${_unameController.text}");
      })
      ..text = "Hello world!"
      ..selection = TextSelection(
          baseOffset: 2, extentOffset: _unameController.text.length);

    //设置焦点状态改变监听
    focusNode1.addListener(() {
      print("focusNode1:${focusNode1.hasFocus}");
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("输入框及表单"),
      ),
      //FixMe:
      // 问题：点击 TextField 并弹出软键盘后，出现 "Bottom overflowed by 111 pixels" 的错误
      // 解决方法：SingleChildScrollView 包裹，这样当键盘弹出时，页面可以滚动，避免内容被遮挡。
      // 注意：在 Scaffold 中 resizeToAvoidBottomInset 默认是 true，出现此问题设置为true不一定有用。
      body: SingleChildScrollView(
        child: Column(
          children: [
            TextField(
              // 是否自动获取焦点。
              autofocus: true,
              //通过 controller获取输入框内容
              controller: _unameController,
              //关联focusNode1
              focusNode: focusNode1,
              decoration: const InputDecoration(
                labelText: "用户名",
                hintText: "用户名或邮箱",
                prefixIcon: Icon(Icons.person),
              ),
            ),

            TextField(
              //是否隐藏正在编辑的文本，如用于输入密码的场景等，文本内容会用“•”替换。
              obscureText: true,
              //监听文本变化
              onChanged: (v) {
                print("onChanged信息：$v");
              },
              //关联 focusNode2
              focusNode: focusNode2,
              decoration: const InputDecoration(
                  labelText: "密码",
                  hintText: "您的登录密码",
                  prefixIcon: Icon(Icons.lock)),
            ),

            //InputDecoration 自定义样式
            const TextField(
              decoration: InputDecoration(
                  labelText: "请输入用户名",
                  prefixIcon: Icon(Icons.person),
                  // 未获得焦点下划线设为灰色
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  //获得焦点下划线设为蓝色
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                  )),
            ),

            //是使用Container去嵌套定义样式
            Container(
              child: const TextField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: "Email",
                  hintText: "电子邮箱地址",
                  prefixIcon: Icon(Icons.email),
                  border: InputBorder.none, //隐藏下划线
                ),
              ),
              decoration: const BoxDecoration(
                  //下划线
                  border: Border(
                      bottom: BorderSide(color: Colors.grey, width: 1.0))),
            ),

            //FixMe：为什么用Builder包裹？-- 似乎不用Builder包裹也可行
            Builder(builder: (ctx) {
              return Column(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      //将焦点从第一个TextField移动 到第二个Field
                      //第一种写法：
                      //FocusScope.of(context).requestFocus(focusNode2);
                      //第二种写法：
                      focusScopeNode ??= FocusScope.of(context);
                      focusScopeNode!.requestFocus(focusNode2);
                    },
                    child: Text("移动焦点"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      focusNode1.unfocus();
                      focusNode2.unfocus();
                    },
                    child: Text("隐藏键盘"),
                  ),
                ],
              );
            }),
          ],
        ),
      ),
    );
  }
}
