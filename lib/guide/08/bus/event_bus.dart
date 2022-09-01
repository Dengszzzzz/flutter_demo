
//订阅者回调签名
//typedef 给某一种特定的函数类型起了一个名字，可以认为是一个类型的别名。或者这样理解：
//自己定义了一种数据类型，不过这种数据类型是函数类型，按照这种类型实例化后的对象，就会具备类型检查；
typedef void EventCallback(arg);

//订阅一个top-level（全局）变量，页面引入该文件后可直接使用bus
var bus = EventBus();

///简单的全局单例事件总线
class EventBus{
  //私有构造函数
  EventBus._internal();

  //保存单例
  static EventBus _singleton = EventBus._internal();

  //工厂构造函数
  factory EventBus() => _singleton;

  //保存事件订阅者队列，key：事件名（id），value：对应事件的订阅者队列
  final _emap = Map<Object,List<EventCallback>?>();

  //添加订阅者
  void on(eventName,EventCallback f){
    //如果_emap[eventName] 返回null，则构建一个List<EventCallback>列表，因为eventName和CallBack是一对多的关系
    // ??= 表示为空，就执行=后面的。
    _emap[eventName] ??= <EventCallback>[];
    _emap[eventName]!.add(f);
  }

  //移除订阅者，可选参数用中括号[]包裹，这里如果不传callback，把eventName整个列表移除
  void off(eventName,[EventCallback? f]){
    var list = _emap[eventName];
    if(eventName == null || list == null) return;
    if(f == null){
      _emap[eventName] = null;
    }else{
      list.remove(f);
    }
  }

  //触发事件，事件触发后该事件所有订阅者会被调用
  void emit(eventName,[arg]){
    var list = _emap[eventName];
    if(list == null) return;
    //反向遍历，防止订阅者在回调中移除自身带来的下标错位
    for(var i = list.length - 1;i >= 0;i--){
      list[i](arg);
    }
  }
}