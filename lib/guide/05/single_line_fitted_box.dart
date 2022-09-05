
import 'package:flutter/material.dart';

class SingleLineFittedBox extends StatelessWidget {
  const SingleLineFittedBox({Key? key,required this.child}) : super(key: key);
  
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (BuildContext context, BoxConstraints constraints){
      return FittedBox(
        child: ConstrainedBox(
          constraints: constraints.copyWith(
            //让minWidth使用屏幕宽度,maxWidth为无限大。
            //这样在child小于屏幕宽度时，可以均分。大于屏幕宽度时，可以缩小适配。
            minWidth: constraints.maxWidth,
            maxWidth: double.infinity,
          ),
          child: child,
        ),
      );
    });
  }
}
