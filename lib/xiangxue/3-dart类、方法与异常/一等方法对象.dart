
//知识点：Dart 是一个真正的面向对象语言，方法也是对象并且具有一种 类型  `Function`。
// 这意味着，方法可以赋值给变量，也可以当做其他方法的参数。可以把方法当做参数调用另外一个方法
// Java接口调用可以改为Dart类型定义方法 如：typedef void onClick();

void fun(Function f){
  f(1);
}
void fun3(void f1(int i ,int j)){

}

//定义一个类型： F 类型， 这个F类型其实就是一个方法，接受两个int参数，返回void
typedef String F(int i,int j);

String fun2(F f){
  return f(1,1);
}

/**
 * Java中使用接口作为回调接口
 */
class OnClickListener{
  void onClick(){}
}

class Button{
  void setOnClickListener(OnClickListener listener){
    listener.onClick();
  }
}

/**
 * Dart中可以直接使用回调方法
 */
//typedef  类型定义方法
typedef void onClick();

class Button1{
  void setOnClickListener(onClick listener){
    listener();
  }
}

void main(){
  // 方法都是对象，可以赋值给Function变量
 /* Function f = fun;
  //匿名方法， lambda表达式， closure闭包
  f((int i,int j){
    return 1;
  });*/

  fun2((int i,int j){ return "1";});

  var list = [1,2,3];
  list.forEach(print);
  var p = print;
  list.forEach(p);

}