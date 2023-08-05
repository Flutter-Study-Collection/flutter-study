extension StringExt on String {
  static const String empty = ''; // 한 번 만 생성된다.

  String toLowerCamelCase() {
    var words = split(' ');
    var capitalized = words.map((word) {
      var firstLetter = word[0].toUpperCase();
      var rest = word.substring(1).toLowerCase();
      return '$firstLetter$rest';
    }).toList();
    capitalized[0] = capitalized[0].toLowerCase();
    return capitalized.join('');
  }

  String toUpperCamelCase() {
    return split(' ').map((word) {
      var firstLetter = word[0].toUpperCase();
      var rest = word.substring(1).toLowerCase();
      return '$firstLetter$rest';
    }).join('');
  }

  String toSnakeCase() {
    return toLowerCase().split(' ').join('_');
  }
}

main () {
  // 기본 예시: 기본 클래스에 더 추가할 수 있다.
  String message = "hello world";
  print(message.toLowerCamelCase());
  print(message.toUpperCamelCase());
  print(message.toSnakeCase());
  // static의 경우엔 extension이름으로 접근해야한다.
  print('isEmpty: ${StringExt.empty.isEmpty}');
}