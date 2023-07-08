import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:todo_app/common/network_constant.dart';
import 'package:todo_app/service/todo_service.dart';

import 'mock/mock_dio.dart';

void main() {
  group('TodoServiceImplementation', () {
    late Dio mockDio;
    late ToDoServiceImpl service;

    setUp(() {
      mockDio = MockDio();
      service = ToDoServiceImpl(dio: mockDio, baseUrl: NetworkConstant.baseUrl);
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

      when(mockDio.get(
              'https://script.google.com/macros/s/AKfycbzUqU2O5fJp6orBq2PLk7wNKFEzpKy3w4gi5c_legsmjILh9hyoc8mONsSf9i6pnJF_/exec'))
          .thenAnswer(
        (_) async => Response(
          requestOptions: RequestOptions(
              path:
                  'https://script.google.com/macros/s/AKfycbzUqU2O5fJp6orBq2PLk7wNKFEzpKy3w4gi5c_legsmjILh9hyoc8mONsSf9i6pnJF_/exec'),
          data: mockResponse,
        ),
      );

      final result = await service.fetchTodoList();
      if (result.isSuccess) {
        var data = result.data;
        expect(1, 2);
        expect(data![0].title, 'Mock todo');
        expect(data[0].done, false);
        expect(data[1].title, 'Another mock todo');
        expect(data[1].done, true);
      } else {
        fail('Should not have failed');
      }
    });
  });
}
