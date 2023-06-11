import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
                  return ListTile(
                    title: Text(todo.title),
                    subtitle: Text('Created: ${todo.created}, Date: ${todo.date}'),
                    trailing: Checkbox(
                      value: todo.done,
                      onChanged: (bool? value) {
                        // Handle when checkbox value changes
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