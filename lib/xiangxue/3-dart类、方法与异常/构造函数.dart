
//构造函数：默认构造函数、命名构造函数、参数初始化列表、重定向构造函数、常量构造函数、工厂构造函数。
//一:默认构造函数、命名构造函数、参数初始化列表、重定向构造函数。
class Person{

  int? age;
  int? name;

  //默认构造函数
  //Person();  //没有方法体可省略{}
  Person(){}

  //命名构造函数
  Person.fromMap(Map map){
  }


  //参数初始化列表
  Person.fromMap2(Map map):
        age = map['age'],
        name = map['name']{
  }

  //重定向构造函数
  Person.fromMap3(Map map):this.fromMap2(map);

  //常量构造函数, Can't define a const constructor for a class with non-final fields
  //const Person.fromMap4(Map map);

  ///  工厂构造函数
  ///  factory 关键字用于定义一种特殊的构造方法，它可以不直接通过调用类的构造器来创建对象，而是提供了更多的灵活性来控制对象的创建过程。
  ///  意思是，它仅仅提供一个方法策略，对象的生成是这方法体里的代码操作，因此最后都要return 一个实例。
  ///  此构造方法的特点：
  ///  1.可以执行额外的逻辑、可以返回现有实例或新创建的实例。
  ///  2.可以在需要时才创建实例。（可以在需要时才创建实例）
  ///  3.可以在需要时才创建实例。（单例模式）
  ///  4.对于不可变类，可以确保所有属性都被正确初始化。（不可变类）
  factory Person.fromMap5(Map map){
    if(map['age'] > 18){
      return Person();
    }
    return Person.fromMap2(map);
  }
}

//二、常量构造函数
class Manager{

  final int x;
  final int y;

  //常量构造函数,类的属性必须是final类型
  const Manager(this.x,this.y);
}

void main(){
  // var manager = Singleton.getInstance();
  // manager.i = 20;
  // print(manager.i);
}