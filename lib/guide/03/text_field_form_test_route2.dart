import 'package:flutter/material.dart';

//https://book.flutterchina.club/chapter3/input_and_form.html#_3-5-1-textfield

class TextFieldAndFormTestRoute2 extends StatefulWidget {
  const TextFieldAndFormTestRoute2({Key? key}) : super(key: key);

  @override
  State<TextFieldAndFormTestRoute2> createState() =>
      _TextFieldAndFormTestRouteState2();
}

class _TextFieldAndFormTestRouteState2
    extends State<TextFieldAndFormTestRoute2> {
  TextEditingController _unameController = TextEditingController();
  TextEditingController _pwdController = TextEditingController();
  GlobalKey _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("输入框及表单2"),
      ),
      body: Form(
        key: _formKey, //设置golbalKey，用于后面获取FormState
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          children: [
            //TextFormField 它继承自FormField类，也是TextField的一个包装类。
            TextFormField(
              autofocus: true,
              controller: _unameController,
              decoration: const InputDecoration(
                labelText: "用户名",
                hintText: "用户名或邮箱",
                icon: Icon(Icons.person),
              ),
              //校验用户名
              validator: (v) {
                return v!.trim().isNotEmpty ? null : "用户名不能为空";
              },
            ),

            TextFormField(
              controller: _pwdController,
              obscureText: true,
              decoration: InputDecoration(
                  labelText: "密码",
                  hintText: "您的登录面",
                  icon: Icon(Icons.password)),
              validator: (v) {
                return v!.trim().length > 5 ? null : "密码不能少于6位";
              },
            ),

            //登录按钮
            Padding(
              padding: EdgeInsets.only(top: 28.0),
              child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      child: Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Text("登录"),
                      ),
                      onPressed: () {

                        /**
                         * FormState为Form的State类，可以通过Form.of()或GlobalKey获得。
                         * 我们可以通过它来对Form的子孙FormField进行统一操作。我们看看其常用的三个方法：
                            FormState.validate()：
                            调用此方法后，会调用Form子孙FormField的validate回调，
                            如果有一个校验失败，则返回false，所有校验失败项都会返回用户返回的错误提示。
                            FormState.save()：
                            调用此方法后，会调用Form子孙FormField的save回调，用于保存表单内容
                            FormState.reset()：
                            调用此方法后，会将子孙FormField的内容清空。

                         * */

                        //通过 _formKey.currentState 获取 FormState后，
                        //调用validate()方法校验用户名密码是否合法，校验通过后再提交数据。
                        if((_formKey.currentState as FormState).validate()){
                          print("检验通过");
                        }

                        //注意，此处不能直接用Form.of(context).validate()，
                        // 因为此处的context为_TextFieldAndFormTestRouteState2 的 context，
                        // 而Form.of(context)是根据所指定context向根去查找，
                        // 而FormState是在FormTestRoute的子树中，所以不行。
                        // 所以如果要用，用Builder包裹一层提供context。

                      },
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
