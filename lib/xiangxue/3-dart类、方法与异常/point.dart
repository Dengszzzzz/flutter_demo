//知识点：
//1. _开头意味着是private，类和方法都是。
//2. 不支持方法重载
//3. 可使用命名构造函数。 Class.命名(xxx) ，此时可能要搭配 late、?、默认值 使用。
//4. const 构造方法。用new和平常一样，用const，如果传递参数一样，则这几个对象是同一个编译期常量对象。

class Point {
  //使用 _ 开始命名的变量就是Java的private
  late int _x;
  int? y;

  Point(this._x, this.y);

  /*Point({int x,int y}){

  }*/

  //命名构造方法  命名更加直观的表示这个构造方法的作用与特性
  //此时赋值y，没赋值_x，需要看情况添加late 或 ？ 或 赋予初始值。
  Point.Cool(int y) {
    this.y = y;
    print("我好帅啊!");
  }

  Point.X(this._x);

  // Point.X(this._x);

  //参数初始化列表 初始化你类当中的属性 可以不写方法体
  Point.fromMap(Map map)
      : _x = map['x'],
        y = map['y'];
}

class ImmutabelPoint {
  final int x;
  final int y;

  // 常量构造方法
  const ImmutabelPoint(this.x, this.y);
}

void main() {
  //使用  new 来创建 常量构造方法的 对象 就和普通的对象没有区别
  //使用const 来创建多个对象，传递参数一样 表示 这几个对象是同一个 编译期常量 对象 （必须定义常量构造函数）
  var p1 = const ImmutabelPoint(1, 1);
  var p2 = const ImmutabelPoint(1, 1);
  print(p1.hashCode == p2.hashCode);
  print(p1 == p2);
}
