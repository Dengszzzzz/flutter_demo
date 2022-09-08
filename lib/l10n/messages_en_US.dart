// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en_US locale. All the
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
  String get localeName => 'en_US';

  static m0(howMany) => "${Intl.plural(howMany, zero: 'There are no emails left', one: 'There is ${howMany} email left', other: 'There are ${howMany} emails left')}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function> {
    "Home" : MessageLookupByLibrary.simpleMessage("Home"),
    "Language" : MessageLookupByLibrary.simpleMessage("Language"),
    "Login" : MessageLookupByLibrary.simpleMessage("Login"),
    "Password" : MessageLookupByLibrary.simpleMessage("Password"),
    "Please input password" : MessageLookupByLibrary.simpleMessage("Please input password"),
    "Please input username" : MessageLookupByLibrary.simpleMessage("Please input username"),
    "Theme" : MessageLookupByLibrary.simpleMessage("Theme"),
    "UserName" : MessageLookupByLibrary.simpleMessage("UserName"),
    "cancel" : MessageLookupByLibrary.simpleMessage("cancel"),
    "logout" : MessageLookupByLibrary.simpleMessage("logout"),
    "logoutTip" : MessageLookupByLibrary.simpleMessage("logoutTip"),
    "no description" : MessageLookupByLibrary.simpleMessage("no description"),
    "remainingEmailsMessage" : m0,
    "title" : MessageLookupByLibrary.simpleMessage("Flutter APP"),
    "username or password wrong!" : MessageLookupByLibrary.simpleMessage("username or password wrong!"),
    "yes" : MessageLookupByLibrary.simpleMessage("yes")
  };
}
