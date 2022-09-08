import 'package:flutter/material.dart';
import 'package:flutter_demo/githupdemo/common/local_model.dart';
import 'package:flutter_demo/l10n/localization_intl.dart';
import 'package:provider/provider.dart';

class LanguageRoute extends StatelessWidget {
  const LanguageRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var color = Theme
        .of(context)
        .primaryColor;
    var localeModel = Provider.of<LocalModel>(context);
    var gm = GmLocalizations.of(context)!;

    ///在方法里定义了方法，和在类中定义该方法的区别在于：
    ///在方法内定义的方法可以共享方法上下文的变量，此处是localeModel，当实际上不建议这么做。
    Widget _buildLanguageItem(String lan, value) {
      return ListTile(
        title: Text(
          lan,
          //对App当前语言进行高亮显示
          style: TextStyle(color: localeModel.getLocale() == value ? color : null),
        ),
        trailing: localeModel.getLocale() == value? Icon(Icons.done,color: color,):null,
        onTap: (){
          //此行代码会通知MaterialApp重新build
          localeModel.setLocale(value);
        },
      );
    }

    return Scaffold(
      appBar: AppBar(title: Text(gm.language),),
      body: ListView(
        children: [
          _buildLanguageItem("中文简体", "zh_CN"),
          _buildLanguageItem("English", "en_US"),
          _buildLanguageItem("自动", null),
        ],
      ),
    );
  }


}
