import 'package:flutter_test/flutter_test.dart';
import 'package:todo_app/repository/todo_repository.dart';
import 'package:todo_app/ui/home/home_view_model.dart';

import '../repository/fake_http_todo_repository.dart';


void main() {
  late TodoViewModel todoViewModel;
  late TodoRepository todoRepository;

  setUp(() {
    todoRepository = FakeHttpTodoRepository();
    todoViewModel = TodoViewModel(todoRepository);
  });

  test('TodoViewModel fetches todo list', () async {
    // Assert
    final result = todoViewModel.todoListStream.first.then((result) {
        result.onSuccess((todoList) {
        expect(todoList, isNotEmpty);
        expect(todoList.first.title, 'Test Todo');
        // 다른 필드들도 체크
        expect(todoList.first.done, isFalse);
      }).onFailure((_) {
        fail('Should not have failed');
      });
    });
  });
}