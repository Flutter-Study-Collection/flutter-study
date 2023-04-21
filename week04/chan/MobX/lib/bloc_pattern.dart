import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (context) => CounterBloc(),
        child: CounterBlocScreen(),
      ),
    );
  }
}

// CounterBloc: Business Logic Component
class CounterBloc extends Cubit<int> {
  CounterBloc() : super(0);

  void incrementCounter() => emit(state + 1);
}

class CounterBlocScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Counter with BLoC')),
      body: Center(
        child: BlocBuilder<CounterBloc, int>(
          builder: (context, count) => Text('Count: $count'),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.read<CounterBloc>().incrementCounter(),
        child: Icon(Icons.add),
      ),
    );
  }
}
