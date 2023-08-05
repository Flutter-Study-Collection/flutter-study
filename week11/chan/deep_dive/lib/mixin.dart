mixin Flyable {
  void fly() {
    print('Flying...');
  }
}

mixin Swimmable {
  void swim() {
    print('Swimming...');
  }
}

class Animal {
  void eat() {
    print('Eating...');
  }
}

class Duck extends Animal with Flyable, Swimmable {}

void main() {
  var duck = Duck();
  duck.eat();  // Prints: Eating...
  duck.fly();  // Prints: Flying...
  duck.swim();  // Prints: Swimming...
}