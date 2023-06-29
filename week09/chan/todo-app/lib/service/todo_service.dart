import 'package:dio/dio.dart';
import '../model/todo_item_data.dart';

/// Service는 일반적으로 백엔드 API와 상호작용하거나, 데이터베이스로부터 데이터를 읽고 쓰는 등의 역할을 하는 객체를 지칭합니다.
/// TodoServiceImplementation은 ToDoService 인터페이스를 구현하는 클래스로, API로부터 할 일(Todo) 리스트를 가져오는 역할을 합니다.
/// 이 서비스는 Dio라는 HTTP 클라이언트를 이용하여 API를 호출합니다.
abstract class ToDoService {
  Future<List<Todo>> fetchTodoList();
}

class TodoServiceImplementation implements ToDoService {
  final Dio _dio;

  TodoServiceImplementation({required Dio dio}): _dio = dio;

  @override
  Future<List<Todo>> fetchTodoList() async {
    final response = await _dio.get('https://script.google.com/macros/s/AKfycbzUqU2O5fJp6orBq2PLk7wNKFEzpKy3w4gi5c_legsmjILh9hyoc8mONsSf9i6pnJF_/exec');
    final List<Todo> result = (response.data as List)
        .map<Todo>((json) => Todo.fromJson(json))
        .toList();
    return result;
  }
}