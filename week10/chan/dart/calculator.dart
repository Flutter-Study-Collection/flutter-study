import 'dart:io';

void main() {
  double result = 0;

  while (true) {
    double num1;

    if(result == 0){
      stdout.write('Enter a number or "end" to quit: ');
      String? numInput = stdin.readLineSync();
      if (numInput == 'end') {
        break;
      }
      num1 = double.tryParse(numInput ?? '') ?? result;
    } else {
      num1 = result;
    }

    stdout.write('Enter an operator (+, -, *, /) or "clear" to reset or "end" to quit: ');
    String? operator = stdin.readLineSync();
    if (operator == 'end') {
      break;
    } else if (operator == 'clear') {
      result = 0;
      print('Cleared');
      continue;
    }

    stdout.write('Enter a number: ');
    String? numInput = stdin.readLineSync();
    double num2 = double.tryParse(numInput ?? '') ?? 0;

    switch (operator) {
      case '+':
        result = num1 + num2;
        break;
      case '-':
        result = num1 - num2;
        break;
      case '*':
        result = num1 * num2;
        break;
      case '/':
        if (num2 != 0) {
          result = num1 / num2;
        } else {
          print('Error: Division by zero');
          continue;
        }
        break;
      default:
        print('Unknown operation: $operator');
        continue;
    }

    print('Result: ${result % 1 == 0 ? result.toInt() : result}');
  }
}

