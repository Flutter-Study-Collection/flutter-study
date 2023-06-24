import 'package:dio/dio.dart';
import 'package:mockito/mockito.dart';

class MockDio extends Mock implements Dio {
  @override
  Future<Response<T>> get<T>(
      String path, {
        Map<String, dynamic>? queryParameters,
        Options? options,
        CancelToken? cancelToken,
        ProgressCallback? onReceiveProgress,
      }) async {
    return super.noSuchMethod(
      Invocation.method(
        #get,
        [
          path,
        ],
        {
          #queryParameters: queryParameters,
          #options: options,
          #cancelToken: cancelToken,
          #onReceiveProgress: onReceiveProgress,
        },
      ),
      returnValue: Future.value(
        Response<T>(
          requestOptions: RequestOptions(path: path),
        ),
      ),
    ) as Future<Response<T>>;
  }
}
// Compare this snippet from test/todo_service_test.dart: