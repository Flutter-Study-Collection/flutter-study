import 'package:flutter/material.dart';

import '../../model/todo_item_data.dart';
import '../../service/todo_service.dart';

class TodoViewModel extends ChangeNotifier {
  final ToDoService _todoService;
  late Future<List<Todo>> todoList;

  TodoViewModel(this._todoService) {
    fetchTodos();
  }

  fetchTodos() {
    todoList = _todoService.fetchTodoList();
    notifyListeners();
  }
}
