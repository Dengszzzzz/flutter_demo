import 'package:flutter/material.dart';

class FutureBuilderTestRoute extends StatefulWidget {
  const FutureBuilderTestRoute({Key? key}) : super(key: key);

  @override
  State<FutureBuilderTestRoute> createState() => _FutureBuilderTestRouteState();
}

class _FutureBuilderTestRouteState extends State<FutureBuilderTestRoute> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: FutureBuilder<String>(
        future: mockNetworkData(),
        builder: (BuildContext context, AsyncSnapshot<String> snapshot){
          if(snapshot.connectionState == ConnectionState.done){
            if(snapshot.hasError){
              return Text('Error:${snapshot.error}');
            }else{
              return Text('Success:${snapshot.data}');
            }
          }else{
            return const CircularProgressIndicator();
          }
        },
      ),
    );
  }
}

Future<String> mockNetworkData() async{
  return Future.delayed(const Duration(seconds: 2),()=> "从网上获取的数据");
}


