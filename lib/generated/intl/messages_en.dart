// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "continue_with_google": MessageLookupByLibrary.simpleMessage(
      "Continue with Google",
    ),
    "email": MessageLookupByLibrary.simpleMessage("Email"),
    "enter_email": MessageLookupByLibrary.simpleMessage(
      "Please enter your email",
    ),
    "enter_password": MessageLookupByLibrary.simpleMessage(
      "Please enter your password",
    ),
    "enter_valid_email": MessageLookupByLibrary.simpleMessage(
      "Please enter a valid email",
    ),
    "forgot_password": MessageLookupByLibrary.simpleMessage("Forgot Password?"),
    "have_account": MessageLookupByLibrary.simpleMessage(
      "Already have an account? ",
    ),
    "login": MessageLookupByLibrary.simpleMessage("Login"),
    "no_account": MessageLookupByLibrary.simpleMessage(
      "Don\'t have an account? ",
    ),
    "password": MessageLookupByLibrary.simpleMessage("Password"),
    "password_length": MessageLookupByLibrary.simpleMessage(
      "Password must be at least 6 characters",
    ),
    "reset_password": MessageLookupByLibrary.simpleMessage("Reset Password"),
    "send": MessageLookupByLibrary.simpleMessage("Send"),
    "sign_up": MessageLookupByLibrary.simpleMessage("Sign Up"),
    "welcome": MessageLookupByLibrary.simpleMessage("Welcome to App"),
  };
}
