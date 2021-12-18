

//知识点:Dart异常都是非检查异常，方法不一定声明了他们所抛出的异常， 并且不要求你捕获任何异常。
//Dart 提供了 `Exception`和`Error` 类型， 以及一些子类型。你还 可以定义自己的异常类型。
// 但是， Dart 代码可以 抛出任何非 null 对象为异常，不仅仅是实现了 `Exception` 或者` Error` 的对象。
// 1.throw 可以指定类型。
// throw new Exception('这是一个异常');
//     throw '这是一个异常';
//     throw 123;

/**
 * 2.捕获异常
 * 与Java不同之处在于捕获异常部分，Dart中捕获异常同样是使用`catch`语句，但是Dart中的`catch`无法指定异常类型。需要结合`on`来使用，基本语法如下：
    try {
    throw 123;
    } on int catch(e){
    //使用 on 指定捕获int类型的异常对象
    } catch(e,s){
    //函数 catch() 可以带有一个或者两个参数， 第一个参数为抛出的异常对象， 第二个为堆栈信息 ( StackTrace 对象)
    rethrow; //使用 `rethrow` 关键字可以 把捕获的异常给 重新抛出
    } finally{
    }
 * */

void test(){
  throw "你太帅了，不给你调用!";
}

int test1(int i){
  if(i == 0){
    throw "1";
  } else if(i == 1){
    throw print;
  }
  return 3;
}

void main(){
  try{
    test();
  }catch(e,s){
    //e: 就是抛出的异常对象 ,如这里就是 String
   // print(e.runtimeType);
  //  print(e);
    //s: StackTrace 调用栈信息
   // print(s.runtimeType);
   // print(s);
  }

  //根据不同的异常类型 进行不同的处理
  // on TYPE catch....
  try{
    test();
  }on Exception catch(e,s){
    print("Exception");
  }on int catch(e){
    print("int");
  } on String catch(e){
    print("String");
  }

  try{
    int r = test1(1);
    if(r == 1){
      //......
    }
  } on Function catch(e){
    e("11111");
    //.......
  } on String catch(e){
    print("String");
    //......
  } finally{

  }
}