import 'package:flutter_test/flutter_test.dart';

/// https://docs.flutter.dev/cookbook/testing/unit/introduction
void main() {
  test('String.split() splits the string on the delimiter', () {
    var string = 'foo,bar,baz';
    expect(string.split(','), equals(['foo', 'bar', 'baz']));
  });

  test('String.trim() removes surrounding whitespace', () {
    var string = '  foo ';
    expect(string.trim(), equals('foo'));
  });

  group('String', () {
    test('.split() splits the string on the delimiter', () {
      var string = 'foo,bar,baz';
      expect(string.split(','), equals(['foo', 'bar', 'baz']));
    });

    test('.trim() removes surrounding whitespace', () {
      var string = '  foo ';
      expect(string.trim(), equals('foo'));
    });
  });

  group('int', () {
    test('.remainder() returns the remainder of division', () {
      expect(11.remainder(3), equals(2));
    });

    test('.toRadixString() returns a hex string', () {
      expect(11.toRadixString(16), equals('b'));
    });
  });
}
