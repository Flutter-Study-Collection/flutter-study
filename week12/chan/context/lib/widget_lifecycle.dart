import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Immutable Widgets')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Stateless Widget
              StatelessExample(),
              // Stateful Widget
              StatefulExample(),
            ],
          ),
        ),
      ),
    );
  }
}

class StatelessExample extends StatelessWidget {
  final String text = "I'm Stateless";

  @override
  Widget build(BuildContext context) {
    print("Building Stateless Widget");
    return Text(text);
  }
}

class StatefulExample extends StatefulWidget {
  @override
  _StatefulExampleState createState() {
    print("Creating Stateful Widget");
    return _StatefulExampleState();
  }
}

class _StatefulExampleState extends State<StatefulExample> {
  int counter = 0;

  void incrementCounter() {
    setState(() {
      counter++;
      print("setState is called");
    });
  }

  @override
  void initState() {
    super.initState();
    print("initState(): Initializing Stateful Widget");
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("didChangeDependencies(): Dependencies changed");
  }

  @override
  Widget build(BuildContext context) {
    print("build(): Rebuilding Stateful Widget"); // 첫 번째 빌드 시에도 호출됩니다.
    return Column(
      children: [
        Text("I'm Stateful, counter: $counter"),
        ElevatedButton(
          onPressed: incrementCounter,
          child: Text('Increment'),
        ),
      ],
    );
  }

  @override
  void didUpdateWidget(covariant StatefulExample oldWidget) {
    super.didUpdateWidget(oldWidget);
    print("didUpdateWidget(): Widget updated");
  }

  @override
  void deactivate() {
    print("deactivate(): Deactivating Stateful Widget");
    super.deactivate();
  }

  @override
  void dispose() {
    print("dispose(): Disposing Stateful Widget");
    super.dispose();
  }

  // Hot Reload
  @override
  void reassemble() {
    print("reassemble(): Reassembling Stateful Widget");
    super.reassemble();
  }
}

