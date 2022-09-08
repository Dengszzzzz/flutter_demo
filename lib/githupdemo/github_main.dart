
import 'package:flutter/material.dart';
import 'package:flutter_demo/githupdemo/common/global.dart';
import 'package:flutter_demo/githupdemo/common/user_model.dart';
import 'package:flutter_demo/githupdemo/common/theme_model.dart';
import 'package:flutter_demo/githupdemo/common/local_model.dart';
import 'package:flutter_demo/githupdemo/routes/home_page.dart';
import 'package:flutter_demo/githupdemo/routes/language_route.dart';
import 'package:flutter_demo/githupdemo/routes/login_route.dart';
import 'package:flutter_demo/githupdemo/routes/theme_change_route.dart';
import 'package:flutter_demo/l10n/localization_intl.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

void main() {
  //一定要确保Global.init()方法不能抛出异常，否则 runApp(MyApp())根本执行不到
  Global.init().then((value) => runApp(MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ///1、我们的根widget是MultiProvider，它将主题、用户、语言三种状态绑定到了应用的根上，
    ///如此一来，任何路由中都可以通过Provider.of()来获取这些状态，也就是说这三种状态是全局共享的！
    return MultiProvider(
      providers: _providers(),
      ///2.在构建MaterialApp时，我们配置了APP支持的语言列表，以及监听了系统语言改变事件；
      ///另外MaterialApp消费（依赖）了ThemeModel和LocaleModel，所以当APP主题或语言改变时MaterialApp会重新构建
      child: Consumer2<ThemeModel,LocalModel>(
        builder: (BuildContext context, themeModel,localeModel,child){
          return MaterialApp(
            ///主题
            theme: ThemeData(
              //主题样本色，通过这个样本色可以在一些条件下生成一些其他的属性
              primarySwatch: themeModel.theme,
            ),
            onGenerateTitle:(BuildContext context){
              ///这里使用了Intl包做国际化
              return GmLocalizations.of(context)!.title;
            },
            home:const HomeRoute(),
            ///国际化
            locale: localeModel.getLocale(),
            supportedLocales: const [
              Locale('en','US'), //美国英语
              Locale('zh','CN'), //中文简体
            ],
            localizationsDelegates: const [
              //本地化的代理
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GmLocalizationsDelegate(),
            ],
            localeResolutionCallback: (Locale? _locale, Iterable<Locale> supportedLocales){
              if(localeModel.getLocale()!=null){
                //如果已选定语言，则不跟随系统
                return localeModel.getLocale();
              }else{
                //跟随系统
                Locale locale;
                if(supportedLocales.contains(_locale)){
                  //如果是App支持的语言
                  locale = _locale!;
                }else{
                  //如果非App支持语言，默认英语
                  locale = const Locale('en','US');
                }
                return locale;
              }
            },
            routes: _routes(),
          );
        },
      ),
    );
  }

  ///状态共享列表
  List<SingleChildWidget> _providers() {
    return [
      ChangeNotifierProvider(create: (BuildContext context) => UserModel()),
      ChangeNotifierProvider(create: (_) => ThemeModel()),
      ChangeNotifierProvider(create: (_) {
        return LocalModel();
      }),
    ];
  }

  ///注册路由表
  Map<String, WidgetBuilder> _routes() => {
    "login": (context) =>  LoginRoute(),
    "themes": (context) =>   ThemeChangeRoute(),
    "language": (context) =>   LanguageRoute(),
  };

}
