import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:navigation/navigation/screen_a/screen_a.dart';
import 'package:navigation/navigation/screen_b/screen_b.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ScreenA(title: 'This is Screen A'),
      routes: <String, WidgetBuilder> {
        '/a': (BuildContext context) => ScreenA(title: 'This is Screen A'),
        '/b': (BuildContext context) => ScreenB(title: 'This is Screen B')
      },
    );
  }
}