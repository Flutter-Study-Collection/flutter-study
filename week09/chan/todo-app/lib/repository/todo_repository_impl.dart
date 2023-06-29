import 'package:todo_app/repository/todo_repository.dart';

import '../../model/todo_item_data.dart';
import '../../service/todo_service.dart';

class HttpTodoRepositoryImpl extends TodoRepository {
  final ToDoService _todoService;

  HttpTodoRepositoryImpl(this._todoService);

  @override
  Future<List<Todo>> fetchTodoList() {
    return _todoService.fetchTodoList();
  }
}
