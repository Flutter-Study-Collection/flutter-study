import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../model/todo_item_data.dart';
import 'provider.dart';

class MyHomePage extends ConsumerWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todoViewModel = ref.watch(todoViewModelProvider);

    return Scaffold(
      body: Center(
        child: FutureBuilder<List<Todo>>(
          future: todoViewModel.todoList,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              final todos = snapshot.data!;
              return ListView.builder(
                itemCount: todos.length,
                itemBuilder: (context, index) {
                  final todo = todos[index];
                  final formattedCreated = DateFormat.yMd().add_Hm().format(DateTime.fromMillisecondsSinceEpoch(todo.created));
                  final formattedDate = DateFormat.yMd().add_Hm().format(DateTime.fromMillisecondsSinceEpoch(todo.date));
                  // 형식화된 로컬 시간을 사용하여 날짜를 표시합니다.
                  return ListTile(
                    title: Text(todo.title),
                    subtitle: Text('Created: $formattedCreated, Date: $formattedDate'),
                    trailing: Checkbox(
                      value: todo.done,
                      onChanged: (bool? value) {
                        // 체크박스 값이 변경될 때 처리하는 로직을 작성합니다.
                      },
                    ),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
