import 'package:flutter_test/flutter_test.dart';
import 'package:widget/week02/counter.dart';

/// https://docs.flutter.dev/cookbook/testing/unit/introduction
/// https://pub.dev/packages/test
void main() {
  test('Counter value should be incremented', () {
    final counter = Counter();
    counter.increment();
    expect(counter.value, 1);
  });
}