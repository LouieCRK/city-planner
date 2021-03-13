import 'dart:developer';

import 'package:flutter/foundation.dart';

class Logger {

  static const _appName = "UCP";
  /// Logs a the [msg] to the device's console if the device is compiled in
  /// debug mode.
  ///
  /// The primary level of logging. Most logging statements should be
  /// debug messages to trace the flow of the program in debug mode but also
  /// to prevent anyone who has a release build of the application from learning
  /// too much about the flow and logic of the application.
  static void logDebug(String msg){
    _log(msg, LoggerLevel.DEBUG);
  }

  // generic logging method
  static void _log(String msg, LoggerLevel level)
  {
    // if release mode do not print debug messages
    if(kReleaseMode && level == LoggerLevel.DEBUG){
      return;
    }
    var dateTime = DateTime.now();
    var contents =
        "[$_appName] [${dateTime.toString()}] [$level] - $msg";
    log(contents);
  }

}

enum LoggerLevel{
  DEBUG, INFO, WARNING, ERROR
}