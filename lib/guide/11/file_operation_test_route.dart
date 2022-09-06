
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

///文件操作
class FileOperationTestRoute extends StatefulWidget {
  const FileOperationTestRoute({Key? key}) : super(key: key);

  @override
  State<FileOperationTestRoute> createState() => _FileOperationTestRouteState();
}

class _FileOperationTestRouteState extends State<FileOperationTestRoute> {

  int _counter = 0;

  @override
  void initState() {
    super.initState();
    //从文件读取点击次数,刷新页面
    ///Future.then 接收异步返回值
    _readCounter().then((value){
      setState(() {
        _counter = value;
      });
    })
    //如果异步任务发生错误，我们可以在catchError中捕获错误
    .catchError((e){

    });
  }


  /*
  * 方法返回一个Future表示该方法中含有耗时操作，当执行到耗时操作的时候，该方法就直接
  * 返回一个Future，从而使得调用该方法的外层方法不去理会该耗时操作继续执行后面的代码
  * 避免阻塞；值得注意的是如果一个方法声明返回的类型是Future对象，但其内部根本没有耗
  * 时操作，那么该方法根本就没有必要声明返回一个Future。而对于一个含有耗时操作的方法
  * (返回Future)来说，虽然在其调用的地方该方法返回了一个Future，但是在该方法自己内部
  * 是阻塞了的(阻塞在await处)。await关键字的作用就是等待耗时操作，比如一个http.get方
  * 法是一个耗时操作，其返回Future，如果调用的时候没有用await修饰，那么代码执行到
  * http.get处时直接跳过(因为http.get返回的是Future)从而避免阻塞，但是如果调用的时候
  * 声明了await，那么方法会阻塞到http.get处，且调用http.get的方法也会返回Future(因为
  * 其内部含有耗时操作).而出现await的方法必须用async修饰。
  * */
  Future<File> _getLocalFile() async{
    // 获取应用目录
    String dir = (await getApplicationDocumentsDirectory()).path;
    return File('$dir/counter.txt');
  }

  /*
  * Dart类库有非常多的返回Future或者Stream对象的函数。 这些函数被称为异步函数：
  * 它们只会在设置好一些耗时操作之后返回，比如像 IO操作。而不是等到这个操作完成。
  * async和await关键词支持了异步编程，允许您写出和同步代码很像的异步代码。
  * */
  Future<int> _readCounter() async{
    try{
      File file = await _getLocalFile();
      //读取点击次数
      String contents = await file.readAsString();
      return int.parse(contents);
    } on FileSystemException{
      return 0;
    }
  }

  _incrementCounter() async{
    setState(() {
      _counter++;
    });
    //将点击次数以字符串类型写到文件中
    await (await _getLocalFile()).writeAsString('$_counter');
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("文件操作"),),
      body: Center(
        child: Text('点击了 $_counter 次'),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: _incrementCounter,
        tooltip: 'Increment',
      ),
    );
  }
}
