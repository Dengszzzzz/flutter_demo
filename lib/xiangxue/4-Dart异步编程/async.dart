//async 表示这是一个异步方法,await必须再async方法中使用
//异步方法只能返回 void和Future
import 'dart:io';

//1.async 表示这是一个异步方法,await必须再async方法中使用。
//2.异步方法只能返回 void和Future。
Future<String> readFile() async {
  //await 等待future执行完成再执行后续代码
  String content = await new File(r"G:\flutter_project\flutter_demo\11.txt").readAsString();
  String content2 = await  new File(r"G:\flutter_project\flutter_demo\11.txt").readAsString();
  //....
  //自动转换为 future
  return "$content$content2";
}

//使用then，如果有10个文件，需要10个then
void readFile2(void callback(s))  {
  String result = "";
  new File(r"G:\flutter_project\flutter_demo\11.txt").readAsString().then((s){
    result += s;
    return new File(r"G:\flutter_project\flutter_demo\11.txt").readAsString();
  }).then((s){
    result+=s;
  }).whenComplete((){
    print(result);
    callback(result);
  });
}

void main(){
  //readFile().then((value) => print(value));
  readFile2((result){

  });
}