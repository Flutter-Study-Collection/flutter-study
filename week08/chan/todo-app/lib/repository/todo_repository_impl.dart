import 'package:todo_app/repository/todo_repository.dart';

import '../../model/todo_item_data.dart';
import '../../service/todo_service.dart';

class HttpTodoRepository extends TodoRepository {
  final ToDoService _todoService;

  HttpTodoRepository(this._todoService);

  @override
  Future<List<Todo>> fetchTodoList() {
    return _todoService.fetchTodoList();
  }
}
