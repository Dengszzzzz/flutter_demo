
//知识点：单例
//1.工厂构造 Factory constructor
//2.静态变量 Static field with getter

//懒汉式
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

//饿汉式
class Singleton2 {

  int? i = 2;
  //私有构造函数
  Singleton2._newInstance();
  //静态变量直接调用构造函数
  static final Singleton2 _instance = Singleton2._newInstance();

  static Singleton2 get instance{
    return _instance;
  }
}

//懒汉式
class Singleton3{

  int? i = 2;

  Singleton3._newInstance(){
    i=3;
  }
  static Singleton3? _instance;
  static Singleton3 get instance =>_getInstance();

  static Singleton3 _getInstance(){
    _instance ??= Singleton3._newInstance();
    return _instance!;
  }
}

