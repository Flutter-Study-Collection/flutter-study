class Person {
  String ssn = "ssn";
  String name = "홍길동";

  Person(this.ssn, this.name);

  // 내용 비교 커스텀
  bool operator ==(other) {
    return (other is Person && other.ssn == ssn && other.name == name);
  }
}

void main() {
  var bob1 =  Person('111', 'Bob');
  var bob2 =  Person('111', 'Bob');
  var robert =  Person('111', 'Robert');

  print(bob1 == bob1); // true
  print(bob1 == bob2); // true(expected: true)
  print(bob1 == robert); // false

  // 값 변경 Ok
  robert.name = "Bob";
  print(bob1 == robert); // true

  print(identical(bob1, bob1)); // true
  print(identical(bob1, bob2)); // false, because these are two different instances
  print(identical(bob1, robert)); // false, because these are two different instances
}