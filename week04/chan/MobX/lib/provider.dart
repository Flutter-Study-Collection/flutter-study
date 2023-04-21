import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ChangeNotifierProvider(
        create: (context) => CounterModel(),
        child: CounterScreen(),
      ),
    );
  }
}

// CounterModel: 상태 관리를 위한 클래스
class CounterModel extends ChangeNotifier {
  int _count = 0;

  int get count => _count;

  void incrementCounter() {
    _count++;
    notifyListeners();
  }
}

class CounterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Counter with Provider')),
      body: Center(
        child: Consumer<CounterModel>(
          builder: (context, model, child) {
            return Text('Count: ${model.count}');
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<CounterModel>().incrementCounter();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
