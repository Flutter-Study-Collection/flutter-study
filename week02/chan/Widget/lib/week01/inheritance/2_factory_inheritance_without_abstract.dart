import 'dart:math';

class Shape {
  // abstract class가 아니면, "'area' must have a method body because 'Shape' isn't abstract." 이란 경고 문구가 뜸.
  // get keyword를 제거하고 0으로 세팅
  num area = 0;
}

class Circle implements Shape { // Shape 상속
  final num radius;
  Circle(this.radius);
  num get area => pi * pow(radius, 2);

  // setter를 별도로 정의해줘야함.
  @override
  set area(num _area) {
    area = _area;
  }
}

class Square implements Shape { // Shape 상속
  final num side;
  Square(this.side);
  num get area => pow(side, 2);

  @override
  set area(num _area) {
    area = _area;
  }
}

void main(){
  testBasic();
  testWithoutAbstract(); // 부모 클래스가 abstract여야함
}

void testBasic(){
  print("# testBasic");
  final circle = Circle(2);
  final square = Square(2);

  print("circle: ${circle.area}"); // 12.566370614359172
  print("square: ${square.area}"); // 4
}

void testWithoutAbstract(){
  print("# testWithoutAbstract");
  final shape = Shape();
  final circle = Circle(2);
  final square = Square(2);

  print("shape: ${shape.area}"); // 0
  print("circle: ${circle.area}"); // 12.566370614359172
  print("square: ${square.area}"); // 4
}