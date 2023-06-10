import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import '../model/todo_item_data.dart';

abstract class ToDoService {
  Future<List<Todo>> fetchTodoList();
}

class TodoServiceImplementation implements ToDoService {
  final Dio _dio = Dio();

  @override
  Future<List<Todo>> fetchTodoList() async {
    final response = await _dio.get('https://script.google.com/macros/s/AKfycbzUqU2O5fJp6orBq2PLk7wNKFEzpKy3w4gi5c_legsmjILh9hyoc8mONsSf9i6pnJF_/exec');
    final List<Todo> result = (response.data as List)
        .map<Todo>((json) => Todo.fromJson(json))
        .toList();
    return result;
  }
}