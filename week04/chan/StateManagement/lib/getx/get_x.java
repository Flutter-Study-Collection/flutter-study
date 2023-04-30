import 'package:flutter/material.dart';

void main() {
  runApp(const CounterApp());
}

class CounterController extends GetxController {
  // RxInt 사용
  var count = 0.obs;

  void increment() {
    count++;
  }
}

class CounterApp extends StatelessWidget {
  // Get.put() 사용하여,  controller 정의
  final CounterController _counterController = Get.put(CounterController());

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
            home: Scaffold(
            appBar: AppBar(
            title: Text('Counter App'),
        ),
    body: Center(
            child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
    Text(
            'Count:',
            style: TextStyle(fontSize: 24.0),
              ),
    Obx(() => Text(
            '${_counterController.count.value}',
            style: TextStyle(fontSize: 48.0),
              )), // Obx로 Observe
    SizedBox(height: 16.0),
    ElevatedButton(
            onPressed: () => _counterController.increment(), // controller를 직접 호출하여 action
            child: Text('Increment'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}