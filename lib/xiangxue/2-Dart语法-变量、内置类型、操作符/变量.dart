
//知识点：Object、var、dynamic ， const 和 final。

void main(){
  //##### 变量 #####
  // 变量是一个引用,未初始化的变量值是null。
  // 可以用Object、var与dynamic声明的变量赋任何类型的值，但是背后的原理却是非常不同。

  Object i = "dengzh";
  var j = "dengzh";
  dynamic name3 = 'dengzh';

  //1、Object：与Java一样Object是所有类的基类，Object声明的变量可以是任意类型。（在 Dart 中 甚至连 数字、方法和 `null` 都是对象，比如int。）

  //2.var：在什么的变量赋值那一刻，就决定它是什么类型。
  /*var k;
  j = "dengzh";
  j = 100;*/

  //3、dynamic：** 不是在编译时候确定实际类型的, 而是在运行时。dynamic声明的变量行为与Object一样，使用一样，关键在于运行时原理不同。
  /*dynamic z = "dynamic-1";
  z = "dynamic-2";
  print(z);*/

  //> 没有初始化的变量自动获取一个默认值为 `null`（类型为数字的 变量如何没有初始化其值也是 null）。
  //>
  //> 在声明变量的时候，也可以选择加上具体 类型：int a = 1;
  //>
  //> 对于局部变量，按照Dart代码风格推荐，使用 `var` 而不是具体的类型来定义局部变量。

  //##### final与const #####
  //如果不打算改变一个变量，可以使用final和const，它们可以替代任何类型，只能在声明时初始化，且不能改变。
  const a =  1;
  final b =1;
  final int c = 1;
  const int d = 1;
  //final与const从使用上根本看不出区别，但是final是运行时常量，而const是编译器常量，它的值在编译期就可以确定，编译时常量能够让代码运行的更高效。

  //正确，因为都在编译期已确定
  const a1 = 1;
  const b1 = a1 + 1;

  //错误，final是运行期确定
  //final a2 = 1;
  //const b2 = a2 + 1;

}