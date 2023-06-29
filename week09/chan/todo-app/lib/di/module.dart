import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../repository/todo_repository.dart';
import '../repository/todo_repository_impl.dart';
import '../service/todo_service.dart';
import '../ui/home/home_view_model.dart';

// dio를 주입합니다.
final dioProvider = Provider((ref) => Dio());

// todoService를 주입합니다.
final todoServiceProvider = Provider((ref) => TodoServiceImplementation(dio: ref.read(dioProvider)));

// todoRepository를 주입합니다. HttpTodoRepository는 TodoRepository를 상속받았기 때문에 타입이 다를 수 있습니다.
// 이는 추후에 FakeHttpTodoRepository를 만들어서 테스트를 진행할 때 유연하게 사용될 수 있습니다.
final todoRepositoryProvider = Provider<TodoRepository>((ref) {
  final todoService = ref.watch(todoServiceProvider);
  return HttpTodoRepositoryImpl(todoService);
});

// todoViewModel을 주입합니다.
final todoViewModelProvider = ChangeNotifierProvider((ref) {
  final todoRepository = ref.watch(todoRepositoryProvider);
  return TodoViewModel(todoRepository);
});