import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../model/todo_item_data.dart';
import '../../service/todo_service.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late Future<List<Todo>> futureTodoList;

  @override
  void initState() {
    super.initState();
    futureTodoList = GetIt.instance<ToDoService>().fetchTodoList();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder<List<Todo>>(
          future: futureTodoList,
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
