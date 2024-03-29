
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:todo_app/service/todo_service.dart';

import 'mock/mock_dio.dart';

void main() {
  group('TodoServiceImplementation', () {
    late Dio mockDio;
    late TodoServiceImplementation service;

    setUp(() {
      mockDio = MockDio();
      service = TodoServiceImplementation(dio: mockDio);
    });

    test('fetchTodoList returns list of Todo', () async {
      final mockResponse = [
        {
          'created': 1634000000,
          'date': 1634000000,
          'title': 'Mock todo',
          'done': false,
        },
        {
          'created': 1634000000,
          'date': 1634000000,
          'title': 'Another mock todo',
          'done': true,
        },
      ];

      when(mockDio.get('https://script.google.com/macros/s/AKfycbzUqU2O5fJp6orBq2PLk7wNKFEzpKy3w4gi5c_legsmjILh9hyoc8mONsSf9i6pnJF_/exec')).thenAnswer(
            (_) async => Response(
          requestOptions: RequestOptions(path: 'https://script.google.com/macros/s/AKfycbzUqU2O5fJp6orBq2PLk7wNKFEzpKy3w4gi5c_legsmjILh9hyoc8mONsSf9i6pnJF_/exec'),
          data: mockResponse,
        ),
      );

      final result = await service.fetchTodoList();

      expect(result.length, 2);
      expect(result[0].title, 'Mock todo');
      expect(result[0].done, false);
      expect(result[1].title, 'Another mock todo');
      expect(result[1].done, true);
    });
  });
}
