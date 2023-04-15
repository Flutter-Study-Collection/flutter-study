import 'dart:io';

import 'package:flutter_test/flutter_test.dart';

/// https://docs.flutter.dev/cookbook/testing/unit/introduction
void main() {
  late HttpServer? server;
  late Uri? url;
  setUp(() async {
    server = await HttpServer.bind('localhost', 0);
    url = Uri.parse('http://${server?.address.host}:${server?.port}');
  });

  tearDown(() async {
    await server?.close(force: true);
    server = null;
    url = null;
  });

  // TODO: test code
}
