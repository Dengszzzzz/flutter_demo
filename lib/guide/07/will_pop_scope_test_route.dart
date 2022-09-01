import 'package:flutter/material.dart';

/// 导航返回拦截 （WillPopScope）
class WillPopScopeTestRoute extends StatefulWidget {
  const WillPopScopeTestRoute({Key? key}) : super(key: key);

  @override
  State<WillPopScopeTestRoute> createState() => _WillPopScopeTestRouteState();
}

class _WillPopScopeTestRouteState extends State<WillPopScopeTestRoute> {
  DateTime? _lastPressedAt; //上次点击事件

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Container(
          alignment: Alignment.center,
          child: const Text("1秒内连续按两次返回键退出"),
        ),
        onWillPop: () async {
          if (_lastPressedAt == null ||
              DateTime.now().difference(_lastPressedAt!) >
                  const Duration(seconds: 1)) {
            //两次点击间隔超过1s则重新计时
            _lastPressedAt = DateTime.now();
            return false;
          }
          return true;
        });
  }
}
