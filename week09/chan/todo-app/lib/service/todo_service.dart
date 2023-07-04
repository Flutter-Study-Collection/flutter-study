import 'package:dio/dio.dart';

import '../model/result.dart';
import '../model/todo_item.dart';
import '../model/todo_response.dart';
import 'handler.dart';

/// Service는 일반적으로 백엔드 API와 상호작용하거나, 데이터베이스로부터 데이터를 읽고 쓰는 등의 역할을 하는 객체를 지칭합니다.
/// ToDoServiceImpl은 ToDoService 인터페이스를 구현하는 클래스로, API로부터 할 일(Todo) 리스트를 가져오는 역할을 합니다.
/// 이 서비스는 Dio라는 HTTP 클라이언트를 이용하여 API를 호출합니다.
abstract class ToDoService {
  Future<Result<List<Todo>>> fetchTodoList();

  Future<Result<List<Todo>>> addTodoItem(Todo item);

  Future<Result<List<Todo>>> removeTodoItem(Todo item);

  Future<Result<List<Todo>>> updateTodoItem(Todo item);
}

class ToDoServiceImpl implements ToDoService {
  final Dio _dio;
  final String _baseUrl;
  final _key = "AKfycbxvBZr0vFChTe7EdHgDacRDfn3rE58kPAXcIFZUtTEv7lcMtCyk3CUjWWLxd9g7GzZs";
  ToDoServiceImpl({required Dio dio, required String baseUrl})
      : _dio = dio, _baseUrl = baseUrl;

  @override
  Future<Result<List<Todo>>> fetchTodoList() {
    return handleRequest(
          () =>  _dio.get('$_baseUrl/$_key/exec'),
          (data) => (data as List).map<Todo>((json) => Todo.fromJson(json)).toList(),
    );
  }

  @override
  Future<Result<List<Todo>>> addTodoItem(Todo item) {
    return handleRequest(
          () =>  _dio.post('$_baseUrl/$_key/exec?title=${item.title}&date=${item.date}&done=${item.done}'),
          (data) => (data as List).map<Todo>((json) => Todo.fromJson(json)).toList(),
    );
  }

  @override
  Future<Result<List<Todo>>> removeTodoItem(Todo item) {
    return handleRequest(
          () =>  _dio.post('$_baseUrl/$_key/exec/remove/${item.created}'),
          (data) => (data as List).map<Todo>((json) => Todo.fromJson(json)).toList(),
    );
  }

  @override
  Future<Result<List<Todo>>> updateTodoItem(Todo item) {
    return handleRequest(
          () =>  _dio.post('$_baseUrl/$_key/exec/update/${item.created}?title=${item.title}&date=${item.date}&done=${item.done}'),
          (data) => (data as List).map<Todo>((json) => Todo.fromJson(json)).toList(),
    );
  }
}
