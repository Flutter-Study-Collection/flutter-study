normalSpreadOperator() {
  var list1 = [1, 2, 3];
  var list2 = [4, 5, 6];
  var combined = [...list1, ...list2];
  print(combined);  // Prints: [1, 2, 3, 4, 5, 6]
}

nonAwareNullSpreadOperator() {
  var list1 = [1, 2, 3];
  var list2;
  var combined = [...?list2, ...list1];
  var combined2 = [-1, -2, -3, ...list1, -7, -8, -9, ...?list2];
  print(combined);  // Prints: [1, 2, 3]
  print(combined2); // Prints: [-1, -2, -3, 1, 2, 3, -7, -8, -9]
}

spreadOperatorAsParam() {
  var numbers1 = [1, 2, 3];
  var numbers2 = [4, 5, 6];
  printNumbers([...numbers1, ...numbers2]);  // Prints: 1, 2, 3, 4, 5, 6

}

void printNumbers(List<int> numbers) {
  for (var number in numbers) {
    print(number);
  }
}

spreadOperatorAsFunction() {
  var moreNumbers = [4, 5, 6];
  var allNumbers = [...?getNumbers(), ...moreNumbers];
  print(allNumbers);  // Prints: [1, 2, 3, 4, 5, 6]
}

List<int>? getNumbers() {
  return [1, 2, 3];
}

spreadOperatorInCreator() {
  var numbers1 = [1, 2, 3];
  var numbers2;
  var myObject = MyClass(numbers1, numbers2);
  print(myObject.numbers);  // Prints: [1, 2, 3];
}

class MyClass {
  List<int> numbers;

  MyClass(List<int> numbers1, List<int>? numbers2)
      : numbers = [...numbers1, ...?numbers2];
}

main() {
  normalSpreadOperator();
  nonAwareNullSpreadOperator();
  spreadOperatorAsParam();
  spreadOperatorAsFunction();
  spreadOperatorInCreator();
}