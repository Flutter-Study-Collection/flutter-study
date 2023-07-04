import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../model/result.dart';
import '../../model/todo_item.dart';
import '../../model/todo_response.dart';
import '../../di/module.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todoViewModel = ref.watch(todoViewModelProvider);

    return Scaffold(
      body: Center(
        child: StreamBuilder<Result<List<Todo>>>(
          stream: todoViewModel.todoListStream,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              final todos = snapshot.data!.data!;
              return ListView.builder(
                itemCount: todos.length,
                itemBuilder: (context, index) {
                  final todo = todos[index];
                  final formattedCreated = DateFormat.yMd().add_Hm().format(DateTime.fromMillisecondsSinceEpoch(todo.created));
                  final formattedDate = DateFormat.yMd().add_Hm().format(DateTime.fromMillisecondsSinceEpoch(todo.date));
                  // 형식화된 로컬 시간을 사용하여 날짜를 표시합니다.
                  return ListTile(
                    key: Key('todo-$index'),
                    title: Text(todo.title),
                    subtitle: Text('Created: $formattedCreated, Date: $formattedDate'),
                    trailing: Checkbox(
                      value: todo.done,
                      onChanged: (bool? value) {
                        todoViewModel.updateTodo(todo.copy(done: value!));
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
