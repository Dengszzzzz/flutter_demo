
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'messages_all.dart'; //1

///注释1的"messages_all.dart"文件是通过intl_generator (opens new window)工具从arb文
///件生成的代码，所以在第一次运行生成命令之前，此文件不存在。注释2处的initializeMessages()
///方法和"messages_all.dart"文件一样，是同时生成的。

class GmLocalizations{

  static Future<GmLocalizations> load(Locale locale){
    final String name = locale.countryCode?.isEmpty==true ? locale.languageCode:locale.toString();
    final String localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((b){  //2
      Intl.defaultLocale = localeName;
      return GmLocalizations();
    });
  }

  static GmLocalizations? of(BuildContext context){
    return Localizations.of<GmLocalizations>(context, GmLocalizations);
  }

  ///   所需要的多语言文字
  String get title{
    return Intl.message(
      'Flutter APP',
      name: "title",
      desc: "Title for the Demo application",
    );
  }

  String get home{return Intl.message('Home',);}

  String get language{return Intl.message('Language',);}

  String get theme{return Intl.message('Theme',);}

  String get login{return Intl.message('Login',);}

  String get userName{return Intl.message('UserName',);}

  String get userNameRequired{return Intl.message('Please input username',);}

  String get password{return Intl.message('Password',);}

  String get passwordRequired{return Intl.message('Please input password',);}

  String get userNameOrPasswordWrong{return Intl.message('username or password wrong!',);}

  String get noDescription{return Intl.message('no description',);}

  String get logout{return Intl.message('logout',);}

  String get logoutTip{return Intl.message('logoutTip',);}

  String get cancel{return Intl.message('cancel',);}

  String get yes{return Intl.message('yes',);}

  //可以看到通过Intl.plural方法可以在howMany值不同时输出不同的提示信息。
  remainingEmailsMessage(int howMany) => Intl.plural(howMany,
      zero: 'There are no emails left',
      one: 'There is $howMany email left',
      other: 'There are $howMany emails left',
      name: "remainingEmailsMessage",
      args: [howMany],
      desc: "How many emails remain after archiving.",
      examples: const {'howMany': 42, 'userName': 'Fred'});

}

//Locale代理类
class GmLocalizationsDelegate extends LocalizationsDelegate<GmLocalizations>{
  const GmLocalizationsDelegate();

  //是否支持某个Locale
  @override
  bool isSupported(Locale locale) {
    return ['en','zh'].contains(locale.languageCode);
  }

  //Flutter会调用此类加载相应的Locale资源类
  @override
  Future<GmLocalizations> load(Locale locale) {
    return GmLocalizations.load(locale);
  }

  //当Localizations Widget重新build时，是否调用load重新加载Locale资源
  @override
  bool shouldReload(covariant LocalizationsDelegate<GmLocalizations> old) {
    return false;
  }

}