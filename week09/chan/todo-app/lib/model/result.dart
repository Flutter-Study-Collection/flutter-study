class Result<T> {
  final T? data;
  final String? error;

  Result({this.data, this.error});

  bool get isSuccess => error == null;

  Result<T> onSuccess(Function(T data) callback) {
    if (isSuccess && data != null) {
      callback(data!);
    }
    return this;
  }

  Result<T> onFailure(Function(String? message) callback) {
    if (!isSuccess) {
      callback(error);
    }
    return this;
  }

  static Result<T> success<T>(T data) => Result(data: data);
  static Result<T> failure<T>(String error) => Result(error: error);
}
