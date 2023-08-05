abstract class Animal {
  String name;

  Animal(this.name);

  String speak() {
    return '...';
  }
}

class Dog implements Animal {
  @override
  String name = 'Dog';

  @override
  String speak() {
    return 'Woof!';
  }

}

class Cat implements Animal {
  @override
  String name = 'Cat';

  @override
  String speak() {
    return 'Meow!';
  }
}
////////////////////////

class Flyable {
  void fly() {}
}

class Bird implements Flyable {
  @override
  void fly() {
    print('The bird is flying');
  }
}

class Airplane implements Flyable {
  @override
  void fly() {
    print('The airplane is flying');
  }
}

void main() {
  var dog = Dog();
  var cat = Cat();

  print(dog.speak());  // Prints: Woof!
  print(cat.speak());  // Prints: Meow!

  Bird bird = Bird();
  bird.fly();  // Prints: The bird is flying

  Airplane airplane = Airplane();
  airplane.fly();  // Prints: The airplane is flying
}