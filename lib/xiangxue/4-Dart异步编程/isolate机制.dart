
import 'dart:io';
import 'dart:isolate';

int? i;
void main(){
  i = 10;
  //创建一个消息接收器
  var receivePort = ReceivePort();

  //将消息接收器当中的发送器 发给 子isolate
  Isolate.spawn(entryPoint, receivePort.sendPort);

  //从消息接收器中读取消息
  receivePort.listen((t) {
    print("接收到其他isolate发过来的消息！");
    //接收到了 子isolate 的 发送器
    if (t is SendPort) {

    } else{
      // i = t;
    }

  });

  sleep(Duration(seconds: 3));
}


void entryPoint(SendPort sendPort) {
  i = 100;
  print(i);
  var receivePort = new ReceivePort();

  var sendPort2 = receivePort.sendPort;

//  sendPort.send(sendPort2);
//  sendPort.send(i);
//
//  receivePort.listen((t){
//
//  });

  sendPort.send("1");
}
