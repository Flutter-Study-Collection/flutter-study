import 'dart:math';

abstract class Shape {
  num get area; // 상속 받으면 필수로 구현해야함. get은 getter를 의미함.
}

class Circle implements Shape { // Shape 상속
  final num radius;
  Circle(this.radius);
  num get area => pi * pow(radius, 2); // from Shape
}

class Square implements Shape { // Shape 상속
  final num side;
  Square(this.side);
  num get area => pow(side, 2); // from Shape
}

void main(){
  testBasic();
}

void testBasic(){
  print("# testBasic");
  final circle = Circle(2);
  final square = Square(2);

  print("circle: ${circle.area}"); // 12.566370614359172
  print("square: ${square.area}"); // 4
}

abstract class Animal {
  num get age; // 상속 받으면 필수로 구현해야함. get은 getter를 의미함.
}

class Dog implements Animal {
  @override
  num get age => throw UnimplementedError(); // Shape 상속
}

class Cat implements Animal {
  @override
  num get age => throw UnimplementedError(); // Shape 상속
}

void testFactoryWithoutAbstract(){
  print("# testBasic");
  final circle = Circle(2);
  final square = Square(2);

  print("circle: ${circle.area}"); // 12.566370614359172
  print("square: ${square.area}"); // 4
}