import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:navigation/navigation/navigation_observer/navigation_observer.dart';
import 'package:navigation/navigation/screen_a/screen_a.dart';
import 'package:navigation/navigation/screen_b/screen_b.dart';
import 'package:navigation/navigation/screen_c/screen_c.dart';
import 'package:navigation/navigation/screen_d/screen_d.dart';
import 'package:navigation/navigation/screen_e/screen_e.dart';

void main() {
  runApp(const ProviderScope(
      child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final routeObserver = MyRouteObserver();

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ScreenA(title: 'This is Screen A'),
      navigatorObservers: [routeObserver],
      routes: <String, WidgetBuilder> {
        '/a': (BuildContext context) => ScreenA(title: 'This is ScreenA with pushNamed()'),
        '/b': (BuildContext context) => ScreenB(title: 'This is ScreenB with pushNamed()'),
        '/c': (BuildContext context) => ScreenC(title: 'This is ScreenC with pushNamed()'),
        '/d': (BuildContext context) => ScreenD(title: 'This is ScreenD with pushNamed()'),
        '/e': (BuildContext context) => ScreenE(title: 'This is ScreenE with pushNamed()')
      },
    );
  }
}