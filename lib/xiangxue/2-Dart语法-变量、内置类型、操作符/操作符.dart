
//知识点：

//1.类型判定操作符
// `as`、 `is`、 和 `is!` 操作符是在运行时判定对象 类型的操作符

//2.赋值操作符
//=`、`+=`、`\=`、`*=`这些不必多说，还有一个 `??=` 操作符用来指定 值为 null 的变量的值

//3.条件表达式
//替代if-else
// `condition ? expr1 : expr2`   var b1 = a1==1?2:3;
//   如果 *condition* 是 true，执行 *expr1* (并返回执行的结果)； 否则执行 *expr2* 并返回其结果。
// - `expr1 ?? expr2`     var b2 = a2??a1;
//   如果 *expr1* 不为null，返回其值； 否则执行 *expr2* 并返回其结果。

//4.级联操作符
// 级联操作符 (`..`) 可以在同一个对象上 连续调用多个函数以及访问成员变量。 使用级联操作符可以避免创建 临时变量， 并且写出来的代码看起来 更加流畅：

//5.安全操作符
// 	Dart提供了 `?.`操作符。左边的操作对象 如果 为 null 则返回 null

import 'package:flutter/cupertino.dart';

void main(){
  //赋值操作符 ??=
  var a;
  a ??= 10;
  print(a);

  //条件表达式
  var a1= 1;
  var b1 = a1==1?2:3;

  var a2;
  var b2 = a2??a1;  //如果a2不为null，返回其值，否则返回a1.

  //级联操作符(和Builder相似,Java中还要每次return自身)
  new Builder()..a()..b();

  //安全操作符
 // String str;
 // print(str?.length);
}



class Builder {
  void a() {}

  void b() {}
}