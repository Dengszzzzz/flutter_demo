import 'dart:io';

void main() {
  //1.通过then可以完成 有序任务的执行，一个任务执行完成之后，下一个任务根据上个任务的结果 执行不同的操作
  Future<String> then = new File(r"G:\flutter_project\flutter_demo\11.txt")
      .readAsString()
      .then((String s) {
    //返回void 或 Future
    print(s);
    return "1";
  });
  then.then((value) => print(value));

  //2.如果需要一组任务都执行完毕之后 再统一执行相同的一些处理
  Future.wait([
    Future.delayed(const Duration(seconds: 1)),
    Future.delayed(const Duration(seconds: 2))
  ]).then((_) {
    //都执行完毕
    print("Future Wait");
  });

  Future.forEach([1, 2, 3, 4], (i) {
    print(i);
  });
}
