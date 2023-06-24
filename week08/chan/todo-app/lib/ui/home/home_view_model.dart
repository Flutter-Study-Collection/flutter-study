import 'package:flutter/material.dart';
import 'package:todo_app/repository/todo_repository.dart';

import '../../model/todo_item_data.dart';

class TodoViewModel extends ChangeNotifier {
  final TodoRepository _todoRepository;
  late Future<List<Todo>> todoList;

  TodoViewModel(this._todoRepository){
    fetchTodos();
  }

  Future<void> fetchTodos() async {
    todoList = _todoRepository.fetchTodoList();
    notifyListeners();
  }
}
