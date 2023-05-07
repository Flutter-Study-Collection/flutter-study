import 'package:mobx/mobx.dart';

// 빌드 후 생성되는 파일을 가져온다. (flutter packages pub run build_runner watch)
part 'counter.g.dart';

// This is the class used by rest of your codebase
class Counter = _Counter with _$Counter;

// The store-class
abstract class _Counter with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}