import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
  const NavBar({Key? key, required this.color, required this.title})
      : super(key: key);

  final String title;
  final Color color; //背景颜色

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        minHeight: 52,
        minWidth: double.infinity,
      ),
      decoration: BoxDecoration(
        color: color,
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            offset: Offset(0,3),
            blurRadius: 3,
          )
        ]
      ),
      child: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          //根据背景色亮度来确定Title颜色
          color: color.computeLuminance() < 0.5 ? Colors.white:Colors.black,
        ),
      ),
      alignment: Alignment.center,
    );
  }
}
