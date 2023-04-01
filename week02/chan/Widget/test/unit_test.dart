import 'package:flutter_test/flutter_test.dart';
import 'package:widget/week02/unit_test/counter.dart';

/// https://docs.flutter.dev/cookbook/testing/unit/introduction
/// https://pub.dev/packages/test
void main() {
  test('Counter value should be incremented', () {
    final counter = Counter();
    counter.increment();
    expect(counter.value, 1);
    counter.increment();
    expect(counter.value, 2);
  });
}
