import 'package:flutter/material.dart';

class FlexTestRoute extends StatefulWidget {
  const FlexTestRoute({Key? key}) : super(key: key);

  @override
  State<FlexTestRoute> createState() => _FlexTestRouteState();
}

class _FlexTestRouteState extends State<FlexTestRoute> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("弹性布局 Flex"),
      ),
      body: Column(
        children: [
          //Flex的两个子widget按1：2来占据水平空间
          Flex(
            direction: Axis.horizontal,
            children: [
              Expanded(
                child: Container(
                  height: 30.0,
                  color: Colors.red,
                ),
                flex: 1,
              ),
              Expanded(
                child: Container(
                  height: 30.0,
                  color: Colors.green,
                ),
                flex: 2,
              ),
            ],
          ),

          Padding(
            padding: EdgeInsets.only(top: 20.0),
            child: SizedBox(
              height: 100.0,
              //Flex的三个子Widget，在垂直方向按2:1:1来占用100像素的空间
              child: Flex(
                direction: Axis.vertical,
                children: [
                  Expanded(
                    flex: 2,
                    child: Container(
                      height: 30.0,
                      color: Colors.red,
                    ),
                  ),

                  ///Spacer是 Expanded的封装而已
                  const Spacer(
                    flex: 1,
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      height: 30.0,
                      color: Colors.green,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
