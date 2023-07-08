import '../model/result.dart';
import '../model/todo_item.dart';

/// 구현체에 abstract 클래스를 상속하여, FakeRepositoryImpl 등을 생성하면 원하는 환경으로 로컬에서 테스트가 가능해집니다.
abstract class TodoRepository {
  Future<Result<List<Todo>>> fetchTodoList();
  Future<Result<List<Todo>>> updateTodo(Todo item);
  Future<Result<List<Todo>>> addTodo(Todo item);
  Future<Result<List<Todo>>> removeTodo(Todo item);
}
