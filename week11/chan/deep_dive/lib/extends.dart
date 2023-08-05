abstract class Animal {
  String name;

  Animal(this.name);

  String speak() {
    return '...';
  }
}

class Dog extends Animal {
  Dog(String name) : super(name);

  // implements와 다르게 override가 강제가 아니다.
  String speak() {
    return 'Woof!';
  }
}

class Cat extends Animal {
  Cat(String name) : super(name);

  // implements와 다르게 override가 강제가 아니다.
  String speak() {
    return 'Meow!';
  }
}

void main() {
  var dog = Dog('Dog');
  var cat = Cat('Cat');

  print(dog.speak());  // Prints: Woof!
  print(cat.speak());  // Prints: Meow!
}