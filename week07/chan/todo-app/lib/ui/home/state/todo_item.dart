
import 'package:flutter_riverpod/flutter_riverpod.dart';

final todoServiceProvider = Provider<ToDoService>((ref) => TodoServiceImplementation());

// TodoList FutureProvider
final todoListProvider = FutureProvider<List<Todo>>((ref) async {
  final todoService = ref.watch(todoServiceProvider);
  return todoService.fetchTodoList();
});