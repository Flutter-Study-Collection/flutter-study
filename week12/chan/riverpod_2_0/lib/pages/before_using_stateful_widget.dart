
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

// StatefulWidget은 별도의 State 클래스를 생성하게 됩니다.
// 이건 매번 번거로울 뿐더러 State 클래스를 생성하면서 생기는 불필요한 코드가 많습니다.
class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0; // 데이터를 유지하기 위해 멤버필드를 사용합니다. 혹은 provider를 사용할 수도 있습니다.

  void _incrementCounter() {
    // 데이터를 변경하는 부분마다 setState를 사용해야합니다.
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
