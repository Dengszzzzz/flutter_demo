
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_demo/guide/10/render_object_animation_mixin.dart';

///Box模型，还有RenderSliver，它们是RenderObject的子类，那到底做了什么？
class RenderCustomCheckbox extends RenderBox with RenderObjectAnimationMixin{

  bool value;
  int pointerId = -1;
  double strokeWidth;
  Color strokeColor;
  Color fillColor;
  double radius;
  ValueChanged<bool>? onChanged;

  //背景动画时长占比（背景动画要在前40%的时间内执行完毕，之后执行打勾动画）
  final double bgAnimationInterval = .4;

  RenderCustomCheckbox(this.strokeWidth, this.strokeColor, this.fillColor,
      this.value, this.radius, this.onChanged){
    progress = value ? 1 : 0;
  }

  @override
  bool get isRepaintBoundary => true;

  ///1.实现布局算法
  //为了使用户可以自定义宽高，我们的布局策略是：
  // 如果父组件指定了固定宽高，则使用父组件指定的，否则宽高默认置为 25：
  @override
  void performLayout() {
    //constrain(Size) 返回既满足约束又尽可能接近给定大小的大小
    //constraints.isTight,判断父组件是否指定了固定宽高
    size = constraints.constrain(constraints.isTight ? Size.infinite:Size(25, 25));
  }

  @override
  void doPaint(PaintingContext context, Offset offset) {
    Rect rect = offset & size;
    // 将绘制分为背景（矩形）和 前景（打勾）两部分，先画背景，再绘制'勾'
    _drawBackground(context, rect);
    _drawCheckMark(context, rect);
  }

  /// 2.画背景
  /// 当状态切换为选中状态时，将矩形逐渐从边缘向中心收缩填充，直到填满 Checkbox 区域。
  /// 当状态切换为未选中状态时，填充从中间逐渐向边缘消散，直到只剩一个边框为止。
  /// 实现的思路是先将整个背景矩形区域全部填充满蓝色，然后在上面绘制一个白色背景的矩形，根据动画进度来动态改变白色矩形区域大小即可
  /// drawDRRect 可以指定内外两个矩形
  void _drawBackground(PaintingContext context, Rect rect) {
    Color color = value ? fillColor : Colors.grey;
    var paint = Paint()
      ..isAntiAlias = true
      ..style = PaintingStyle.fill //填充
      ..strokeWidth
      ..color = color;

    // 我们需要算出每一帧里面矩形的大小，为此我们可以直接根据矩形插值方法来确定里面矩形
    final outer = RRect.fromRectXY(rect, radius, radius);
    var rects = [
      rect.inflate(-strokeWidth),
      Rect.fromCenter(center: rect.center, width: 0, height: 0)
    ];
    // 根据动画执行进度调整来确定里面矩形在每一帧的大小
    var rectProgress = Rect.lerp(
      rects[0],
      rects[1],
      // 背景动画的执行时长是前 40% 的时间
      min(progress, bgAnimationInterval) / bgAnimationInterval,
    )!;
    final inner = RRect.fromRectXY(rectProgress, 0, 0);
    // 绘制
    context.canvas.drawDRRect(outer, inner, paint);
  }

  /// 3.画 "勾"
  void _drawCheckMark(PaintingContext context, Rect rect) {
    // 在画好背景后再画前景
    if (progress > bgAnimationInterval) {
      //确定中间拐点位置
      final secondOffset = Offset(
        rect.left + rect.width / 2.5,
        rect.bottom - rect.height / 4,
      );
      // 第三个点的位置
      final lastOffset = Offset(
        rect.right - rect.width / 6,
        rect.top + rect.height / 4,
      );
      // 我们只对第三个点的位置做插值
      final _lastOffset = Offset.lerp(
        secondOffset,
        lastOffset,
        (progress - bgAnimationInterval) / (1 - bgAnimationInterval),
      )!;

      // 将三个点连起来
      final path = Path()
        ..moveTo(rect.left + rect.width / 7, rect.top + rect.height / 2)
        ..lineTo(secondOffset.dx, secondOffset.dy)..lineTo(
            _lastOffset.dx, _lastOffset.dy);

      final paint = Paint()
        ..isAntiAlias = true
        ..style = PaintingStyle.stroke
        ..color = strokeColor
        ..strokeWidth = strokeWidth;

      context.canvas.drawPath(path, paint..style = PaintingStyle.stroke);
    }
  }


  ///5.响应点击事件
  // 必须置为true，确保能通过命中测试
  @override
  bool hitTestSelf(Offset position) => true;

  // 只有通过命中测试，才会调用本方法，我们在手指抬起时触发事件即可
  @override
  void handleEvent(PointerEvent event, covariant BoxHitTestEntry entry) {
    if (event.down) {
      pointerId = event.pointer;
    } else if (pointerId == event.pointer) {
      // 手指抬起时触发回调
      onChanged?.call(!value);
    }
  }
}