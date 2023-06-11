import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../service/todo_service.dart';
import 'home_view_model.dart';

final todoServiceProvider = Provider((ref) => TodoServiceImplementation());
final todoViewModelProvider = ChangeNotifierProvider((ref) {
  final todoService = ref.watch(todoServiceProvider);
  return TodoViewModel(todoService);
});