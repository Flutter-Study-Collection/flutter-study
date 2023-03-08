---
title: Dart 입문
type: slide
slideOptions:
#Black(default)/White/League/Sky/Beige
#Simple/Serif/Blood/Night/Moon/Solarized
  theme: 'sky' 
  transition: 'fade'
  spotlight:
    enabled: true
  # transition: 'background' #none/fade/slide/convex/concave/zoom
  # transitionSpeed: 'slow' #default/fast/slow
  # backgroundTransition: 'fade' #none/fade/slide/convex/concave/zoom
  # controls: true
  # progress: true
  # defaultTiming: 10
  # slideNumber: true
  # keyboard: true
  # overview: true
  # touch: true
  # help: true
  # mouseWheel: true
  # autoPlayMedia: true
  # allottedMinutes: 15 #minutes

  
---

### Dart 입문

---

- constructors
- parameters
- getters and setters
- privacy
- factories
- functional programming
- other concepts

---

### entry point of dart

```
void main() {
    // start from here.
}
```

```
void main(List<String> args) {
    // you can get args from command line.
}
```

---

#### class

```!=
class Bicycle {
  int cadence;
  int speed;
  int gear;
}
```

```
fun main(){
  val bicycle = new Bicycle(2, 0, 1) // 에러
}
```

---

1. 생성자가 있어야한다.
```!=
class Bicycle {
  int cadence;
  int speed;
  int gear;
  
  // 추가된 내용
  Bicycle(int cadence, int speed, int gear)
      : this.cadence = cadence,
        this.speed = speed,
        this.gear = gear;
}
```

```
fun main(){
  val bicycle = Bicycle(2, 0, 1) // new 생략 가능
}
```

---

2. 모든 class는 toString()을 가지고 있다.
```
print(bycycle)

// 결과: Instance of 'Bicycle'
```
toString()을 오버라이딩하면 입맛에 맞게 출력할 수 있다.
```
class Bicycle {
  int cadence;
  int speed;
  int gear;
  
  ...
  
  @override
  String toString() => 'Bicycle: $speed mph';
  // $또는 ${}으로 변수를 따옴표 안에서 출력 가능하다.
}

// 결과: Bicycle: 0 mph
```

---

3. No public, private, or protected keywords

```
class Bicycle {
  ...
  int _speed = 0;
  int get speed => _speed;
  
  Bicycle(this.cadence, this.gear);
  
  @override
  String toString() => 'Bicycle: $speed mph';
}
```
read-only로 하려면 private으로 만들도록 변수명을 _로 시작해야하며, get 키워드를 사용하여 getter를 만들어야한다.
이 때, 해당값은 초기값이 있어야한다.(null도 가능)

---

4. class functions
```
class Bicycle {
  ...
  void applyBrake(int decrement) {
    _speed -= decrement;
  }

  void speedUp(int increment) {
    _speed += increment;
  }
}
```
class의 함수는 자바와 매우 흡사하다.
```!=
var bike = Bicycle(2, 1);
print(bike); // Bicycle: 0 mph
bike.applyBrake(2);
print(bike); // Bicycle: -2 mph
bike.speedUp(4);
print(bike); // Bicycle: 2 mph
```

---

5. optional named parameters
```!=
class Bicycle {
  ...
  
  Bicycle({this.cadence = 10, this.gear = 5}); // {, }로 감싸주었으며, defult값이 설정 되어있어야한다.
  
  @override
  String toString() => 'Bicycle: $speed mph';
}
```

```!=
// 파라미터 갯수가 optional하게 줄어들 수 있으며,
// 따로 세팅 값이 없으면, default 값을 사용한다.
print(Rectangle(origin: const Point(10, 20), width: 100, height: 200));
print(Rectangle(origin: const Point(10, 10)));
print(Rectangle(width: 200));
print(Rectangle());
```

---


---


### [Dart Codelabs](https://dart.dev/codelabs)

- [From Java to Dart](https://developers.google.com/codelabs/from-java-to-dart#0)
- [Dart Cheatsheet](https://dart.dev/codelabs/dart-cheatsheet)
- [Iterables](https://dart.dev/codelabs/iterables)
- [Async Await](https://dart.dev/codelabs/async-await)
- [Null Safety](https://dart.dev/codelabs/null-safety)

---
