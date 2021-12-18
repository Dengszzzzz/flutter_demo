
//知识点：
//与Java的八大内置基本数据类型不同，Dart 内置支持下面这些类型：
//- numbers
// - strings
// - booleans
// - lists (也被称之为 *arrays*)
// - maps
// - runes (用于在字符串中表示 Unicode 字符)
// - symbols

//### Numbers（数值）
// `num`是数字类型的父类，有两个子类` int`和 `double`。

//### 字符串
//1.支持$,'',""
//2.支持创建多行字符串对象， ''' xx ''' , """ xx """
//3.提供一个 `r` 前缀可以创建一个 “原始 raw” 字符串

//### Lists（列表）
//在Dart中，数组就是`List`对象。对`List`进行遍历也和Java一样。
//var list = [1,2,3];
//var list2 = List.filled(1, 默认值, growable: false);
//var list3 = const[1,2,3]; 不可变，无法add

//### Maps（映射集合）
//Map：键值对相关的对象。 键和值可以是任何类型的对象。每个 键 只出现一次， 而一个值则可以出现多次。
//var map1 = {'a': '阿里巴巴', 't': '腾讯', 'b': '百度'};
//var map2 = Map();

//### Runes（用于在字符串中表示Unicode字符）
//如果需要获得特殊字符的Unicode编码，或者需要将32位的Unicode编码转换为字符串，就可以借助Runes类。
//Dart表达Unicode代码点的常用方法是\uXXXX，其中XXXX是4位十六进制值。要指定多于或少于4个十六进制数字，需要将值放在大括号中。

//### Symbols
//操作符标识符，可以看作C中的宏。表示编译时的一个常量

void main(){
  //stringStudy();
  //listStudy();
  //mapStudy();
  runeStudy();
}

void stringStudy(){
  var name = 'lance';
  var a = "my name is $name!";
  var b = "my name is ${name.toUpperCase()}!";
  //Java用+号，dart可省略
  var c  = "my name is ""lance";

  //三个单引号或双引号，可以创建多行字符串对象
  var d = '''
    You can create
    multi-line strings like this one.
    ''';
  var d2 = """
  This is also a
  multi-line string.
    """;
  print(d2);

  //提供一个 `r` 前缀可以创建一个 “原始 raw” 字符串
  print(r"换行符：\n");// 换行符：\n  r:不需要转义
  print("换行符：\n");// 换行符：\n
}

void listStudy(){
  var list = [1,2,3];
  print(list[list.length-1]);
  list[0] = 2;

  //使用new，可以省略
  var list2 = List.filled(1, 999, growable: false);
  print(list2[0]);
  list2[0] = 2;
  print(list2[0]);

  //在 list 字面量之前添加 const 关键字，可以 定义一个不变的 list 对象（编译时常量）
  //var list3 = const[1,2,3];
  //list3.add(10);
}

void mapStudy(){
 //直接声明，用{}表示，里面写key和value，每组键值对中间用逗号隔开
  var map1 = {'a': '阿里巴巴', 't': '腾讯', 'b': '百度'};
  var map2 = new Map();
  map2['a'] = '阿里巴巴';
  map2['t'] = '腾讯';
  map2['b'] = '百度';

  //添加元素
  map2['j'] = '京东';
  //获取与修改元素
  var c = map2['c']; ///没有对应的key返回null
  map2['a'] = 'alibaba';
}

void runeStudy(){
  var clapping = '\u{1f44f}'; ///5个16进制 需要使用{}
  print(clapping);//👏
//获得 16位代码单元
  print(clapping.codeUnits); //[55357, 56399]
//获得unicode代码
  print(clapping.runes.toList()); //[128079]

//fromCharCode 根据字符码创建字符串
  print( String.fromCharCode(128079));
  print( String.fromCharCodes(clapping.runes));
  print( String.fromCharCodes([55357, 56399]));
  print( String.fromCharCode(0x1f44f));

  Runes input = new Runes(
      '\u2665  \u{1f605}  \u{1f60e}  \u{1f47b}  \u{1f596}  \u{1f44d}');
  print(String.fromCharCodes(input));
}