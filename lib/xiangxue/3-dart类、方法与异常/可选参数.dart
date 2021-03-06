
//知识点：可选参数。
//1.可选位置参数：[]，要有默认值，给第二个位置传值必须要给第一个位置传值。
//2.可选命名参数：{}。


//可选位置参数
void fun([int i = 1,int j = 2]){
  print(i);
  print(j);
}


//可选命名参数
void fun1({int i = 1,int j = 2}){

}
//都可以设置默认参数值

void main(){
  //如果想给j传值，就必须保证要给i传值， 因为 位置！！！！
  fun(10,1);

  fun1(j:10);
  fun1(j:10,i:11);

  //不需要再像java一样，写一大堆的重载函数，并且能够提供参数默认值。
}

