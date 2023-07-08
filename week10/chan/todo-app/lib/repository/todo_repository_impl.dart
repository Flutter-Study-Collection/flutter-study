import 'package:todo_app/repository/todo_repository.dart';

import '../../model/todo_response.dart';
import '../../service/todo_service.dart';
import '../model/result.dart';
import '../model/todo_item.dart';

class HttpTodoRepositoryImpl extends TodoRepository {
  final ToDoService _todoService;

  HttpTodoRepositoryImpl(this._todoService);

  @override
  Future<Result<List<Todo>>> fetchTodoList() {
    return _todoService.fetchTodoList();
  }

  @override
  Future<Result<List<Todo>>> addTodo(Todo item) {
    return _todoService.addTodoItem(item);
  }

  @override
  Future<Result<List<Todo>>> removeTodo(Todo item) {
    return _todoService.removeTodoItem(item);
  }

  @override
  Future<Result<List<Todo>>> updateTodo(Todo item) {
    return _todoService.updateTodoItem(item);
  }
}
