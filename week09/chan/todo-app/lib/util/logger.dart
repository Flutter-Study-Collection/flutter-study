
import 'package:flutter/foundation.dart';
import 'package:logging/logging.dart';

final log = Logger('MyLogger');

void setupLogging() {
  Logger.root.level = Level.ALL;

  Logger.root.onRecord.listen((record) {
    // kDebugMode, kReleaseMode, kProfileMode가 있다.
    if (kDebugMode) {
      print('${record.level.name}: ${record.time}: ${record.message}');
      if (record.error != null) {
        print('Error: ${record.error}');
      }
      if (record.stackTrace != null) {
        print('Stack Trace: ${record.stackTrace}');
      }
    }
  });
}
