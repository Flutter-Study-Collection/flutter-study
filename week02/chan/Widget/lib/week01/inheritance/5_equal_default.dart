class Person {
  String ssn;
  String name;

  Person(this.ssn, this.name);
}

void main() {
  var bob1 =  Person('111', 'Bob');
  var bob2 =  Person('111', 'Bob');
  var robert =  Person('111', 'Robert');

  print(bob1 == bob1); // true
  print(bob1 == bob2); // true(expected: true)
  print(bob1 == robert); // false
  print(identical(bob1, bob2)); // false, because these are two different instances
  print(identical(bob1, robert)); // false, because these are two different instances
}