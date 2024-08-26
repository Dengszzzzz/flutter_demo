
//知识点：单例
//1.工厂构造：推荐用于标准单例模式，易于理解和使用。 -- 推荐
//2.静态变量与私有构造函数：适用于需要更明确控制实例化的场景。
//3.懒加载：在需要节省资源或避免不必要的实例化时使用。
//4.简单静态变量：适合简单、无复杂初始化逻辑的单例类。
//注意：在 Dart 的默认模型下，代码在单个线程上运行，因此不需要复杂的锁定机制来实现线程安全，也就是双重锁检查在Dart中不必要。

///官方推荐
//懒汉式 - 在第一次被请求时才创建单例对象，此类是调用getInstance()才创建
class Singleton {
  int? i = 2;
  //1.私有构造函数
  Singleton._newInstance();
  //2.静态私有变量
  static Singleton? _instance;
  //3.工厂构造方法
  factory Singleton.getInstance() {
    _instance ??= Singleton._newInstance();
    return _instance!;
  }
}

//饿汉式 - 类加载时创建，如静态私有变量直接指向 Singleton2._newInstance()
class Singleton2 {
  int? i = 2;
  //私有构造函数
  Singleton2._newInstance();
  //静态私有变量直接调用构造函数
  static final Singleton2 _instance = Singleton2._newInstance();
  //静态私有变量向外提供一个get方法
  static Singleton2 get instance{
    return _instance;
  }
}

//懒汉式
class Singleton3{
  int? i = 2;
  Singleton3._newInstance(){ i=3; }
  static Singleton3? _instance;
  static Singleton3 get instance =>_getInstance();

  //和Singleton2的区别，在于调用静态变量_instance的get方法时，才创建单例对象
  //这种写法和 Singleton 用factory思想是一样的。
  static Singleton3 _getInstance(){
    _instance ??= Singleton3._newInstance();
    return _instance!;
  }
}

void main(){
  var manager = Singleton.getInstance();
  manager.i = 20;
  print(manager.i);
}

