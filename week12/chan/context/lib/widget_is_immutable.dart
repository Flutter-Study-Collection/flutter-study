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
              StatelessExample(fixedText: "I'm StatelessExample"),
              // Stateful Widget
              StatefulExample(fixedText: "I'm StatefulExample",),
            ],
          ),
        ),
      ),
    );
  }
}

class StatelessExample extends StatelessWidget {
  final String fixedText;
  var variableText;

  StatelessExample({required this.fixedText, this.variableText = 'Default'});

  @override
  Widget build(BuildContext context) {
    // variableText는 변경 가능하지만, build 메서드 내에서 변경하는 것은 의미가 없습니다.
    // 이 변수가 변경될 경우 새로운 인스턴스를 생성해야 합니다.
    return Text(fixedText + ' ' + variableText);
  }
}


class StatefulExample extends StatefulWidget {
  final String fixedText;
  var variableText;

  StatefulExample({required this.fixedText, this.variableText = 'Default'});

  @override
  _StatefulExampleState createState() => _StatefulExampleState();
}

class _StatefulExampleState extends State<StatefulExample> {
  // stateful 위젯의 필드는 변경할 수 없습니다.
  // widget.text = "새로운 값"; // 컴파일 에러
  // widget.variableText를 변경하는 것은 의미가 없으며, 올바른 패턴이 아닙니다.

  int counter = 0;

  void incrementCounter() {
    setState(() {
      counter++;
      print("setState(): Stateful Widget");
    });
  }

  @override
  Widget build(BuildContext context) {
    print("Rebuilding Stateful Widget");
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
}
