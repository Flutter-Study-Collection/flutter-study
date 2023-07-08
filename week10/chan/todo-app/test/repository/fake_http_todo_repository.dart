
import 'package:todo_app/model/result.dart';
import 'package:todo_app/model/todo_item.dart';
import 'package:todo_app/repository/todo_repository.dart';

// 테스트를 할 땐, FakeTodoRepository를 사용하고, 실제 서버와 통신을 할 땐 HttpTodoRepository를 사용합니다.
class FakeHttpTodoRepository implements TodoRepository {
  static List<Todo> fakeTodos = [Todo(created: 123456789, date: 123456789, title: 'Test Todo', done: false)];

  @override
  Future<Result<List<Todo>>> fetchTodoList() {
    // 실제 네트워크 통신을 하지 않고 로컬에서 가짜 데이터를 반환합니다.
    // 이렇게하면 테스트 시 로컬에서 빠르게 테스트를 진행할 수 있습니다.
    // 단, 실제 서버와 통신을 하지 않기 때문에 서버와의 통신이 정상적으로 되는지는 테스트할 수 없습니다.
    // 이는 테스트의 목적이 앱 자체를 테스트하기 위한 것이고, 외부 환경이 동적으로 변화해서는 안되기 떄문에 로컬에서만 테스트를 진행하는 것이 좋습니다
    return Future.value(Result.success(fakeTodos));
  }

  @override
  Future<Result<List<Todo>>> addTodo(Todo item) {
    // TODO: implement addTodo
    throw UnimplementedError();
  }

  @override
  Future<Result<List<Todo>>> removeTodo(Todo item) {
    // TODO: implement removeTodo
    throw UnimplementedError();
  }

  @override
  Future<Result<List<Todo>>> updateTodo(Todo item) {
    // TODO: implement updateTodo
    throw UnimplementedError();
  }
}