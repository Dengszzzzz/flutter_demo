
//知识点：单例
//1.工厂构造 Factory constructor
//2.静态变量 Static field with getter


class Singleton {

  int? i = 2;
  static Singleton? _instance;

  //私有构造函数
  Singleton._newInstance();

  //工厂构造方法，必须返回一个 实例对象
  factory Singleton.getInstance() {
    _instance ??= Singleton._newInstance();
    return _instance!;
  }
}

//静态变量 Static field with getter
class Singleton2 {

  int? i = 2;

  //私有构造函数
  Singleton2._newInstance();

  static final Singleton2 _instance = Singleton2._newInstance();

  static Singleton2 get instance{
    return _instance;
  }
}

