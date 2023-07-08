import 'dart:async';

import 'package:flutter/material.dart';
import 'package:todo_app/repository/todo_repository.dart';

import '../../model/result.dart';
import '../../model/todo_item.dart';

class TodoViewModel extends ChangeNotifier {
  final TodoRepository _todoRepository;
  final _todoListController = StreamController<Result<List<Todo>>>();
  Stream<Result<List<Todo>>> get todoListStream => _todoListController.stream;
  String? errorMessage;

  TodoViewModel(this._todoRepository){
    fetchTodos();
  }

  Future<void> fetchTodos() async {
    var result = await _todoRepository.fetchTodoList();
    _todoListController.add(result);
  }

  Future<void> updateTodo(Todo item) async {
    var result = await _todoRepository.updateTodo(item);
    _todoListController.add(result);
  }

  Future<void> addTodo(Todo item) async {
    var result = await _todoRepository.addTodo(item);
    _todoListController.add(result);
  }

  Future<void> removeTodo(Todo item) async {
    var result = await _todoRepository.removeTodo(item);
    _todoListController.add(result);
  }

  // ViewModel이 종료될 때 호출됩니다.
  @override
  void dispose() {
    _todoListController.close();
    super.dispose();
  }
}
