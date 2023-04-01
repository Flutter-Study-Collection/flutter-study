class Bicycle {
  int cadence = 0;
  int gear = 0;

  int _speed = 0;
  int get speed => _speed;

  String name = "John";

  Bicycle({this.cadence = 10, this.gear = 5});

  // 중복 생성자를 생성할 수 없어서 .required란 것을 따로 붙여줌.
  Bicycle.required({required this.name, this.cadence = 10, this.gear = 5});

  Bicycle.someOptional(this.name, {this.cadence = 10, this.gear = 5}); // optional 밖에 있다는 거 자체가 필수 파라미터를 의미.

  // Bicycle.outRequired(required this.name, {this.cadence = 10, this.gear = 5}); // Not possible

  void applyBrake(int decrement) {
    _speed -= decrement;
  }

  void speedUp(int increment) {
    _speed += increment;
  }

  @override
  String toString() => '$name Bicycle: $speed mph, gear: $gear, cadence: $cadence';
}

void main() {
  var bike = Bicycle();

  testSpeedVariable(bike);
  testOptionalNamedParameters();
  testRequiredParameters();
  testSomeOptionalParameters();
}

// 1. _speed가 variable인지 체크
void testSpeedVariable(Bicycle bike) {
  print("# testSpeedVariable");
  print(bike.toString());
  bike.applyBrake(1);
  print(bike.toString());
  bike.speedUp(5);
  print(bike.toString());
}

void testOptionalNamedParameters(){
  print("# testOptionalNamedParameters");
  var bike1 = Bicycle();
  var bike2 = Bicycle(cadence: 3);
  var bike3 = Bicycle(gear: 3);
  var bike4 = Bicycle(gear: 3, cadence: 5);
  print(bike1.toString());
  print(bike2.toString());
  print(bike3.toString());
  print(bike4.toString());
}

// required 키워드가 들어간 애들은 무조건 값을 대입해주어야함.
void testRequiredParameters(){
  print("# testRequiredParameters");
  var bike1 = Bicycle.required(name: "John");
  var bike2 = Bicycle.required(cadence: 3, name: 'Hey');
  var bike3 = Bicycle.required(gear: 3, name: 'Yo');
  var bike4 = Bicycle.required(gear: 3, cadence: 5, name: 'Hi');
  print(bike1.toString());
  print(bike2.toString());
  print(bike3.toString());
  print(bike4.toString());
}

void testSomeOptionalParameters(){
  print("# testSomeOptionalParameters");
  var bike1 = Bicycle.someOptional("John");
  var bike2 = Bicycle.someOptional("John", cadence: 3, gear: 5);
  var bike3 = Bicycle.someOptional("John", gear: 3);
  var bike4 = Bicycle.someOptional("John", gear: 3, cadence: 5);
  print(bike1.toString());
  print(bike2.toString());
  print(bike3.toString());
  print(bike4.toString());
}