import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:network/ui/home/model/todo_item_data.dart';

import 'todo_item.dart';

final counterProvider = StateNotifierProvider<ToDoItem, ToDoItemData>((ref) {
  return ToDoItem();
});