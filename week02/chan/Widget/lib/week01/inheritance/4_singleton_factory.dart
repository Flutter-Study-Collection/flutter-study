import 'dart:math';

abstract class Shape {
  num get area; // 상속 받으면 필수로 구현해야함. get은 getter를 의미함.

  factory Shape(String type) { // factory 키워드 사용
    if (type == 'circle') return Circle.instance;
    if (type == 'square') return Square.instance;
    throw 'Can\'t create $type.';
  }
}

// Top-Level function
Shape shapeFactory(String type) {
  if (type == 'circle') return Circle.getInstance(4);
  if (type == 'square') return Square.instance;
  throw 'Can\'t create $type.';
}

class Circle implements Shape { // Shape 상속
  final num radius;
  static final Circle _instance = Circle._(2);
  static Circle get instance => _instance;
  Circle._(this.radius);

  static final Map<num, Circle> _cache = {};

  static Circle getInstance(num radius) {
    // 이미 존재하면 값을 반환하고, 없으면 새로운 값을 캐싱 후 instance를 리턴
    return _cache.putIfAbsent(radius, () => Circle._(radius));
  }

  num get area => pi * pow(radius, 2);
}

class Square implements Shape { // Shape 상속
  final num side;

  static final Square _instance = Square._(2);
  static Square get instance => _instance;

  Square._(this.side);
  // Square(this.side);

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
  print("square: ${square1.area}"); // 4
  print("square equals: ${square1 == square2}"); // true(expected: true)
  print("square identical: ${identical(square1, square2)}"); // true(expected: true)
}

void testFactoryNewInstance(){
  print("# testFactoryNewInstance");
  final circle = shapeFactory("circle");
  final square1 = shapeFactory("square");
  final square2 = shapeFactory("square");

  print("circle: ${circle.area}"); // 12.566370614359172
  print("square: ${square1.area}"); // 4
  print("square equals: ${square1 == square2}"); // true(expected: true)
  print("square identical: ${identical(square1, square2)}"); // true(expected: true)
}