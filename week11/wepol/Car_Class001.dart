//자동차 클래스 구현하기

void main() {
  Car bmw = Car(320, 100000, 'BMW');
  Car benz = Car(250, 70000, 'BENZ');
  Car ford = Car(200, 80000, 'FORD');

  bmw.saleCar();
  bmw.saleCar();
  bmw.saleCar();
  bmw.saleCar();
  benz.saleCar();

  print(bmw.price);
  print(benz.price);
}

class Car {
  int? maxSpeed;
  num? price;
  String? name;

  Car(int maxSpeed, num price, String name) {
    this.maxSpeed = maxSpeed;
    this.price = price;
    this.name = name;
  }

  num? saleCar() {
    price = price! * 0.9;
    return price;
  }
}
