import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'ui/home/home_screen.dart';
import 'util/logger.dart';

void main() {
  init();
  runApp(const ProviderScope(child: MyApp()));
}

void init() {
  setupLogging();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomeScreen(),
    );
  }
}