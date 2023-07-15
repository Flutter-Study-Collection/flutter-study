import 'dart:io';

void main() {
  stdout.write("사칙연산 프로그램 \n");
  while (true) {
    stdout.write('두 수를 띄어서 입력해주세요:');
    String? input = stdin.readLineSync();

    if (input == 'end') {
      break;
    }

    List<String> nums = input!.split(' ');

    stdout.write('연산자를 입력해주세요:');
    String? op = stdin.readLineSync();

    int? num1 = int.tryParse(nums[0]);
    int? num2 = int.tryParse(nums[1]);

    if (input == 'clear') {
      nums.clear();
    }

    if (num1 == null || num2 == null) {
      print('값이 잘못되었습니다. 두 숫자만 입력해주세요.');
      continue;
    }

    if (op == '+') {
      int sum = num1 + num2;
      print('$num1 + $num2 = $sum');
    }

    if (op == '-') {
      int min = num1 + num2;
      print('$num1 + $num2 = $min');
    }

    if (op == '*') {
      int mul = num1 * num2;
      print('$num1 * $num2 = $mul');
    }

    if (op == '/') {
      double div = num1 / num2;
      print('$num1 / $num2 = $div');
    }
  }
}

