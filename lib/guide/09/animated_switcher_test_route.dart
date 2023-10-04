import 'package:flutter/material.dart';

class AnimatedSwitcherCounterRoute extends StatefulWidget {
  const AnimatedSwitcherCounterRoute({super.key});

  @override
  State<AnimatedSwitcherCounterRoute> createState() =>
      _AnimatedSwitcherCounterRouteState();
}

///Widget切换动画
///效果：“0”正在逐渐缩小，而“1”逐渐放大
///注意：Widget必须不复用，满足一个条件即可，key不同或type不同，同Type可指定不同key
class _AnimatedSwitcherCounterRouteState
    extends State<AnimatedSwitcherCounterRoute> {
  int _count = 0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedSwitcher(
            duration: Duration(milliseconds: 500),
            transitionBuilder: (child, animation) {
              //执行缩放动画
              return ScaleTransition(child: child, scale: animation);
            },
            child: Text(
                '$_count',
              //显示指定key，不同的key会被认为是不同的Text，这样才能执行动画
               key: ValueKey<int>(_count),),
          ),
          ElevatedButton(
            child: const Text('+1',),
            onPressed: () {
              setState(() {
                _count += 1;
              });
            },
          ),
        ],
      ),
    );
  }
}
