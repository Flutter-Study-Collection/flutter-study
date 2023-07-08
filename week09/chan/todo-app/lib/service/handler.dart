import 'package:dio/dio.dart';

import '../model/result.dart';

Future<Result<T>> handleRequest<T>(Future<Response> Function() request, T Function(dynamic) transform) async {
  try {
    Response response = await request();
    return response.statusCode == 200
        ? Result.success(transform(response.data))
        : Result.failure('Request failed with status: ${response.statusCode}');
  } catch (e) {
    return Result.failure(e.toString());
  }
}