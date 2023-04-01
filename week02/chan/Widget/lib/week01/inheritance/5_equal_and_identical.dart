import 'dart:math';

class Person {
  String ssn;
  String name;

  Person(this.ssn, this.name);

  // Define that two persons are equal if their SSNs are equal
  bool operator ==(other) {
    return (other is Person && other.ssn == ssn);
  }
}

void main() {
  var bob =  Person('111', 'Bob');
  var robert =  Person('111', 'Robert');

  print(bob == robert); // true
  print(identical(bob, robert)); // false, because these are two different instances
}