### 一、包结构
项目工程目录：
github_client_app
├── android
├── fonts
├── l10n-arb
├── imgs
├── ios
├── jsons    //放入.json文件，后续生成Dart Model
├── lib
└── test
Dart代码都在lib目录：
lib
├── common     //一些工具类，如通用方法类、网络接口类、保存全局变量的静态类等
├── l10n       //国际化相关的类都在此目录下
├── models     //Json文件对应的Dart Model类会在此目录下
├── states     //保存APP中需要跨组件共享的状态类
├── routes     //存放所有路由页面类
└── widgets    //APP内封装的一些Widget组件都在该目录下

### 二、全局变量及共享状态
共享状态和全局变量的不同在于前者发生改变时需要通知所有使用该状态的组件，而后者不需要。

### 三、国际化
1.生成arb文件，在项目根目录下输入：
flutter pub pub run intl_generator:extract_to_arb --output-dir=l10n-arb \ lib/l10n/localization_intl.dart
会在I10n-arb文件下生成arb文件，随后复制创建各语言的arb文件，如intl_zh_CN.arb。
2.生成dart代码。
由于Windows不识别 *，所以打开git bash，在项目根目录下输入：
flutter pub pub run intl_generator:generate_from_arb --output-dir=lib/l10n --no-use-deferred-loading lib/l10n/localization_intl.dart l10n-arb/intl_*.arb

