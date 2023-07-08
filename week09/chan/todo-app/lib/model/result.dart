class Result<T> {
  final T? data;
  final String? error;

  Result({this.data, this.error});

  bool get isSuccess => error == null;

  Result<T> onSuccess(Function(T data) callback) {
    print('onSuccess is called1');
    if (isSuccess && data != null) {
      print('onSuccess is called2');
      callback(data!);
    }
    print('onSuccess is called3');
    return this;
  }

  Result<T> onFailure(Function(String? message) callback) {
    print('onFailure is called1');
    if (!isSuccess) {
      print('onFailure is called2');
      callback(error);
    }
    print('onFailure is called3');
    return this;
  }

  static Result<T> success<T>(T data) => Result(data: data);
  static Result<T> failure<T>(String error) => Result(error: error);
}
