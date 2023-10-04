
import 'dart:math';

import 'package:flutter/material.dart';

///棋盘和棋子
///待优化：棋盘是不变的，shouldRepaint返回false，棋子应该受外部状态改变，应该返回true，
///所以这里棋子棋盘应该拆成两个Widget的。
class CustomPaintRoute extends StatelessWidget {

  const CustomPaintRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
             ///1.优化点2
            ///ElevatedButton点击水波纹绘制，水波动画执行过程中画布会不停的刷新，所以就导致了CustomPaint 不停的重绘。
            ///用RepaintBoundary包裹CustomPaint可解决这个问题。
             RepaintBoundary(
              child: CustomPaint(
                size: Size(300,300), //指定画布大小
                painter: MyPainter(),  //背景画笔
              ),
            ),
            //添加一个刷新button
            ElevatedButton(onPressed: () {}, child: Text("刷新"))
          ],
        ),
    );
  }
}

class MyPainter extends CustomPainter{

  @override
  void paint(Canvas canvas, Size size) {
    print('paint');
    var rect = Offset.zero & size;
    //画棋盘
    drawChessboard(canvas, rect);
    //画棋子
    drawPieces(canvas, rect);
  }

  /// 在UI树重新build时，控件在绘制前都会先调用该方法以确定是否有必要重绘；
  /// 假如外部状态改变不会影响我们的UI外观，那么就应该返回false；
  /// 如果绘制依赖外部状态，判断依赖的状态是否改变，如果已改变则应返回true来重绘，反之则应返回false不需要重绘。
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }

  //绘制棋盘
  void drawChessboard(Canvas canvas, Rect rect) {
    //棋盘背景
    var paint = Paint()
      ..isAntiAlias = true
      ..style = PaintingStyle.fill //填充
      ..color = Color(0xFFDCC48C);
    canvas.drawRect(rect, paint);

    //画棋盘网格
    paint
      ..style = PaintingStyle.stroke //线
      ..color = Colors.black38
      ..strokeWidth = 1.0;
    //画横线
    for (int i = 0; i <= 15; ++i) {
      double dy = rect.top + rect.height / 15 * i;
      canvas.drawLine(Offset(rect.left, dy), Offset(rect.right, dy), paint);
    }
    //画竖线
    for (int i = 0; i <= 15; ++i) {
      double dx = rect.left + rect.width / 15 * i;
      canvas.drawLine(Offset(dx, rect.top), Offset(dx, rect.bottom), paint);
    }
  }

  //画棋子
  void drawPieces(Canvas canvas, Rect rect) {
    double eWidth = rect.width / 15;
    double eHeight = rect.height / 15;
    //画一个黑子
    var paint = Paint()
      ..style = PaintingStyle.fill
      ..color = Colors.black;
    //画一个黑子
    canvas.drawCircle(
      Offset(rect.center.dx - eWidth / 2, rect.center.dy - eHeight / 2),
      min(eWidth / 2, eHeight / 2) - 2,
      paint,
    );
    //画一个白子
    paint.color = Colors.white;
    canvas.drawCircle(
      Offset(rect.center.dx + eWidth / 2, rect.center.dy - eHeight / 2),
      min(eWidth / 2, eHeight / 2) - 2,
      paint,
    );
  }
}
