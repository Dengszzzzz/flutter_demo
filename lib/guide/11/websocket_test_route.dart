import 'package:flutter/material.dart';
import 'package:web_socket_channel/io.dart';

class WebSocketTestRoute extends StatefulWidget {
  const WebSocketTestRoute({Key? key}) : super(key: key);

  @override
  State<WebSocketTestRoute> createState() => _WebSocketTestRouteState();
}

class _WebSocketTestRouteState extends State<WebSocketTestRoute> {

  TextEditingController _controller = TextEditingController();
  late IOWebSocketChannel channel;
  String _text = "";

  @override
  void initState() {
    super.initState();
    //连接流
    channel = IOWebSocketChannel.connect('ws://echo.websocket.org');
    // channel.stream.listen((event) {
    //
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("WebSocket"),),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Form(child: TextFormField(
              controller: _controller,
              decoration: InputDecoration(label:Text('Send a message')),
            )),
            StreamBuilder(
                stream: channel.stream,
                builder: (BuildContext context, AsyncSnapshot snapshot){
                  //网络不通会走到这
                  if (snapshot.hasError) {
                    _text = "网络不通...";
                  } else if (snapshot.hasData) {
                    _text = "echo: "+snapshot.data;
                  }
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 24.0),
                    child: Text(_text),
                  );
                })
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _sendMessage,
        child: Icon(Icons.add),
      ),
    );
  }

  void _sendMessage() {
    if(_controller.text.isEmpty){
      //发送
      channel.sink.add(_controller.text);
    }
  }

  @override
  void dispose() {
    //关闭流
    channel.sink.close();
    super.dispose();
  }

}
