class Person {
  // const와 final은 단짝임.
  const Person(this.ssn, this.name);

  final String ssn;
  final String name;

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
  print(bob1 == bob2); // false
  print(bob1 == robert); // false

  // 값 변경 불가(final)
// robert.name = "Bob";

  print(identical(bob1, bob1)); // true
  print(identical(bob1, bob2)); // false, because these are two different instances
  print(identical(bob1, robert)); // false, because these are two different instances
}
