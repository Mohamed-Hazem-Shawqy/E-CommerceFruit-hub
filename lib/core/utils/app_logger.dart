import 'package:flutter/foundation.dart';

abstract class AppLogger {
  static logger( String message) {
    if (kDebugMode) {
      print('LOG:🟡(${message.toUpperCase()})');
    }
  }
}
