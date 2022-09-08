// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a zh_CN locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, always_declare_return_types

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = MessageLookup();

typedef String MessageIfAbsent(String? messageStr, List<Object>? args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'zh_CN';

  static m0(howMany) => "${Intl.plural(howMany, zero: '没有未读邮件', one: '有${howMany}封未读邮件', other: '有${howMany}封未读邮件')}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function> {
    "Home" : MessageLookupByLibrary.simpleMessage("首页"),
    "Language" : MessageLookupByLibrary.simpleMessage("语言"),
    "Login" : MessageLookupByLibrary.simpleMessage("登录"),
    "Password" : MessageLookupByLibrary.simpleMessage("密码"),
    "Please input password" : MessageLookupByLibrary.simpleMessage("请输入密码"),
    "Please input username" : MessageLookupByLibrary.simpleMessage("请输入用户名"),
    "Theme" : MessageLookupByLibrary.simpleMessage("换肤"),
    "UserName" : MessageLookupByLibrary.simpleMessage("用户名"),
    "cancel" : MessageLookupByLibrary.simpleMessage("取消"),
    "logout" : MessageLookupByLibrary.simpleMessage("注销"),
    "logoutTip" : MessageLookupByLibrary.simpleMessage("注销提示"),
    "no description" : MessageLookupByLibrary.simpleMessage("暂无介绍"),
    "remainingEmailsMessage" : m0,
    "title" : MessageLookupByLibrary.simpleMessage("Github客户端"),
    "username or password wrong!" : MessageLookupByLibrary.simpleMessage("用户名或密码错误!"),
    "yes" : MessageLookupByLibrary.simpleMessage("确认")
  };
}
