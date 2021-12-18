
//知识点：
//1.每一个实例属性 变量都会有一个隐式的 get，非final 还有 set
//2.运算符重载。

class Point{
  int _x = 10;
  int? _y;

  //x是方法名
  int get x=>_x;
  set x(int x) => _x = x;

  //运算符重载，定义 + 操作的行为
  Point operator +(Point other){
    var point = Point();
    point._x = _x + other.x;
    return point;
  }

  String operator -(int x){
    return "hahahaha";
  }
}


void main(){
  var point = Point();
  point.x = 20;
  var point2 = point + Point();
  print(point2.x);
  print(point2 - 2);
}