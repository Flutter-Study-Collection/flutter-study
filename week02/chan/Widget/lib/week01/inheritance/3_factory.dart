import 'dart:math';

abstract class Shape {
  num get area; // 상속 받으면 필수로 구현해야함. get은 getter를 의미함.

  factory Shape(String type) { // factory 키워드 사용
    if (type == 'circle') return Circle(2);
    if (type == 'square') return Square(2);
    throw 'Can\'t create $type.';
  }

  factory Shape.newInstance(String type) {
    if (type == 'circle') return new Circle(2); // Unnecessary new keyword.
    if (type == 'square') return new Square(2);
    throw 'Can\'t create $type.';
  }
}

// Top-Level function
Shape shapeFactory(String type) {
  if (type == 'circle') return Circle(2);
  if (type == 'square') return Square(2);
  throw 'Can\'t create $type.';
}

class Circle implements Shape { // Shape 상속
  final num radius;
  Circle(this.radius);
  num get area => pi * pow(radius, 2);
}

class Square implements Shape { // Shape 상속
  final num side;
  Square(this.side);
  num get area => pow(side, 2);
}


void main(){
  testFactory();
  testFactoryNewInstance();
}

void testFactory(){
  print("# testFactory");
  final circle = Shape("circle");
  final square1 = Shape("square");
  final square2 = Shape("square");

  print("circle: ${circle.area}"); // 12.566370614359172
  print("square1: ${square1.area}"); // 4
  print("square2: ${square2.area}"); // 4
  print("square equals: ${square1 == square2}"); // false(expected: true)
  print("square identical: ${identical(square1, square2)}"); // false(expected: true)
}

void testFactoryNewInstance(){
  print("# testFactoryNewInstance");
  final circle = shapeFactory("circle");
  final square1 = shapeFactory("square");
  final square2 = shapeFactory("square");

  print("circle: ${circle.area}"); // 12.566370614359172
  print("square1: ${square1.area}"); // 4
  print("square2: ${square2.area}"); // 4
  print("square equals: ${square1 == square2}"); // false(expected: true)
  print("square identical: ${identical(square1, square2)}"); // false(expected: true)
}