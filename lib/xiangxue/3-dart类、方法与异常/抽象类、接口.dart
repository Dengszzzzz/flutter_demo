
//知识点：
//1.抽象类：abstract关键字，修饰类，不需要修饰方法。
//2.Dart中没有interface一说，java中的接口在Dart中的表现仍然是抽象类，抽象类可以被继承，也可以被实现。
//  继承，之类需要实现抽象方法。实现，之类需要实现抽象类的属性和方法。

//Dart的抽象类
abstract class Person{
  int a = 2;
  void eat(){
    print("Person eat");
  }
  void drink(){
    print("Person drink");
  }
  void say();  //并不需要abstract关键字修饰
}
//继承抽象类
class Person2 extends Person{

  @override
  void say() {
    print("Person2 say");
  }
}

//实现抽象类
class Person3 implements Person{

  @override
  int a = 50;

  @override
  void drink() {
    print("Person3 drink");
  }

  @override
  void eat() {
    print("Person3 eat");
  }

  @override
  void say() {
    print("Person3 say");
  }
}

void main(){
  var person2 = Person2();
  person2.drink();
  person2.say();

  var person3 = Person3();
  person3.drink();
  person3.say();
}
