import '../model/todo_item_data.dart';

/// 구현체에 abstract 클래스를 상속하여, FakeRepositoryImpl 등을 생성하면 원하는 환경으로 로컬에서 테스트가 가능해집니다.
abstract class TodoRepository {
  Future<List<Todo>> fetchTodoList();
}
