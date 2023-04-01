class Person {
  String ssn = "ssn";
  String name = "홍길동";

  Person(this.ssn, this.name);

  // Define that two persons are equal if their SSNs are equal
  bool operator ==(other) {
    return (other is Person && other.ssn == ssn);
  }
}

void main() {
  var bob =  Person('111', 'Bob');
  var robert =  Person('111', 'Robert');

  print(bob == bob); // true
  print(bob == robert); // true
  print(identical(bob, robert)); // false, because these are two different instances
  print(const Object() == const Object());  // true
  print(3 == 1+2);  // true
  print(identical(const Object(), const Object()));  // true
  print(identical(3, 1+2));  // true
}