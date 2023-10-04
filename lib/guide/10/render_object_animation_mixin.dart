import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

///mixin代表可混入，on是什么？难道是因为不能extends，所以用来做类似于继承的概念？
///这里mixin定义了抽象类，doPaint()是待实现方法。
///on的含义，是继承还是限制？其实应该是限制，比如这个mixin依赖于RenderObject的paint方法，
///目的是子类继承RenderObject，而RenderObject的paint方法，交给混入的这个mixin处理。
///简单理解：
///A extends B with C，mixin C on B，B里有个test()方法，C重写了B的test()方法。
///那么A的test()，实际上是调用C的test()了。当然如果A内部也重写了test()方法，优先级就是A>B>C。
mixin RenderObjectAnimationMixin on RenderObject{

  double _progress = 0;
  int? _lastTimeStamp;

  // 动画时长，子类可以重写
  Duration get duration => const Duration(milliseconds: 200);
  AnimationStatus _animationStatus = AnimationStatus.completed;
  // 设置动画状态
  set animationStatus(AnimationStatus v) {
    if (_animationStatus != v) {
      markNeedsPaint();
    }
    _animationStatus = v;
  }

  double get progress => _progress;
  set progress(double v) {
    _progress = v.clamp(0, 1);
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    doPaint(context, offset); // 调用子类绘制逻辑
    _scheduleAnimation();
  }


  ///4.调度动画
  ///让动画动起来，一是将 CustomCheckbox 用一个 StatefulWidget 包装起来，二是自定义动画调度。
  ///思路：在一帧绘制结束后判断动画是否结束，如果动画未结束，则将将当前组件标记为”需要重绘“，然后等待下一帧即可：
  void _scheduleAnimation() {
    if (_animationStatus != AnimationStatus.completed) {
      // 需要在Flutter 当前frame 结束之前再执行，因为不能在绘制过程中又将组件标记为需要重绘
      SchedulerBinding.instance.addPostFrameCallback((Duration timeStamp){
        if (_lastTimeStamp != null) {
          double delta = (timeStamp.inMilliseconds - _lastTimeStamp!) /
              duration.inMilliseconds;
          // 如果是反向动画，则 progress值要逐渐减小
          if (_animationStatus == AnimationStatus.reverse) {
            delta = -delta;
          }
          //更新动画进度
          progress = progress + delta;

          if (progress >= 1 || progress <= 0) {
            //动画执行结束
            _animationStatus = AnimationStatus.completed;
            progress = progress.clamp(0, 1);
          }
        }
        //标记为需要重绘
        markNeedsPaint();
        _lastTimeStamp = timeStamp.inMilliseconds;
      });
    } else {
      _lastTimeStamp = null;
    }
  }

  // 子类实现绘制逻辑的地方
  void doPaint(PaintingContext context, Offset offset);
}