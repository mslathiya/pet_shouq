import 'package:flutter/foundation.dart';

class AppLog {
  static const String _defaultTagPrefix = "PetShouq";

  ///use Log.v. Print all Logs
  static const int verbose = 2;

  ///use Log.d. Print Debug Logs
  static const int debug = 3;

  ///use Log.i. Print Info Logs
  static const int info = 4;

  ///use Log.w. Print warning logs
  static const int warn = 5;

  ///use Log.e. Print error logs
  static const int error = 6;

  ///use Log.wtf. Print Failure Logs(What a Terrible Failure= WTF)
  static const int unknown = 7;

  ///SET APP LOG LEVEL, Default ALL
  static int _currentLogLevel = verbose;

  AppLog(String s);

  static setLogLevel(int priority) {
    int newPriority = priority;
    if (newPriority <= verbose) {
      newPriority = verbose;
    } else if (newPriority >= unknown) {
      newPriority = unknown;
    }
    _currentLogLevel = newPriority;
  }

  static int getLogLevel() {
    AppLog.i("Current Log Level is ${_getPriorityText(_currentLogLevel)}");
    return _currentLogLevel;
  }

  static _log(int priority, String tag, String message) {
    if (_currentLogLevel <= priority) {
      if (kDebugMode) {
        print("${_getPriorityText(priority)}$tag: $message");
      }
    }
  }

  static String _getPriorityText(int priority) {
    switch (priority) {
      case info:
        return "INFOⓘ|";
      case debug:
        return "DEBUG|";
      case error:
        return "ERROR⚠️|️";
      case warn:
        return "WARN⚠️|";
      case unknown:
        return "WTF¯\\_(ツ)_/¯|";
      case verbose:
      default:
        return "";
    }
  }

  ///Print general logs
  static v(String message, {String tag = _defaultTagPrefix}) {
    _log(verbose, tag, message);
  }

  ///Print info logs
  static i(String message, {String tag = _defaultTagPrefix}) {
    _log(info, tag, message);
  }

  ///Print debug logs
  static d(String message, {String tag = _defaultTagPrefix}) {
    _log(debug, tag, message);
  }

  ///Print warning logs
  static w(String message, {String tag = _defaultTagPrefix}) {
    _log(warn, tag, message);
  }

  ///Print error logs
  static e(String message, {String tag = _defaultTagPrefix}) {
    _log(error, tag, message);
  }

  ///Print failure logs
  static wtf(String message, {String tag = _defaultTagPrefix}) {
    _log(unknown, tag, message);
  }
}
