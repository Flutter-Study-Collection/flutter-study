import 'package:flutter_test/flutter_test.dart';
import 'package:todo_app/ui/home/home_view_model.dart';

import '../repository/fake_http_todo_repository.dart';


void main() {
  test('TodoViewModel fetches todo list', () async {
    // Arrange
    final todoRepository = FakeHttpTodoRepository();
    final todoViewModel = TodoViewModel(todoRepository);

    // Act
    await todoViewModel.fetchTodos();

    // Assert
    expect(todoViewModel.todoList, isNotNull);
    final todoList = await todoViewModel.todoList;
    expect(todoList, isNotEmpty);
    expect(todoList.first.title, 'Test Todo');
  });
}