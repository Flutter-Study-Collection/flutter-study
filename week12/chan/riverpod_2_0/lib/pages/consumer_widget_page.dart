import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ConsumerWidgetPage extends ConsumerWidget {
  final String title;

  ConsumerWidgetPage({super.key, required this.title});

  @override
  Widget build(BuildContext context, WidgetRef ref) { // WidgetRef 추가적으로 사용합니다.
    // 데이터를 유지하기 위해 멤버필드나 provider를 사용할 필요없이 useState를 사용하면 데이터가 유지됩니다.
    // 내부적으로는 ValueNotifier를 사용합니다.
    var counter = useState(0);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '${counter.value}', // ValueNotifier이기 때문에 value로 데이터를 가져옵니다.
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => counter.value++, // ValueNotifier이기 때문에 value로 데이터를 변경합니다.
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}