class SingletonOne {
  SingletonOne._privateConstructor();

  static final SingletonOne _instance = SingletonOne._privateConstructor();

  factory SingletonOne() {
    return _instance;
  }
}

void main(){
  final instance1 = SingletonOne();
  final instance2 = SingletonOne();

  print("instances equals: ${instance1 == instance2}"); // true(expected: true)
  print("instances identical: ${identical(instance1, instance2)}"); // true(expected: true)
}