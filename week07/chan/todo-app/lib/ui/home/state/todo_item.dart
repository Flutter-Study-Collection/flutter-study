
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ToDoItem extends StateNotifier<int> {
  ToDoItem() : super(0);
  void increment() => state++;
}