
//知识点：
//1.with 混合，被mixin(混入)的类不能有构造函数，且要指定mixin。如果是既要继承又要混入，指定mixin class
//2.C with  B, A  同名方法优先级是自身> 右到左。
//3.如果同时使用 extends with implements，顺序就是如此。

mixin A  {
  void a(){
    print("A  的a方法!");
  }
}

//Dart 3.0开始，出现 mixin class
mixin class B{
  void b(){
    print("b方法");
  }
  void a(){
    print("B  的a方法!");
  }
}

// 满足了我们的多继承的需求
class C with B, A{

  void c(){

  }
  // 重写了 混入类的a方法
  /*void a(){

  }*/
}

//C 就是A B的混合类
//class C = Object with A, B;

void main(){
  //1、自身是第一优先级
  //2、如果自身没有对应的方法，就从with最右边开始查找方法
  var c = new C();
  c.a();

}

