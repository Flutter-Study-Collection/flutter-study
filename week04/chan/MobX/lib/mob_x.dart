import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CounterMobxScreen(),
    );
  }
}

class CounterMobxScreen extends StatelessWidget {
  final _mobx = CounterMobx();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Counter with MobX')),
      body: Center(
        child: Observer(
          builder: (_) => Text('Count: ${_mobx.count}'),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _mobx.incrementCounter,
        child: Icon(Icons.add),
      ),
    );
  }
}
