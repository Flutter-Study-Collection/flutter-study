import 'dart:io';

void main() {
  stdout.write('구구단 프로그램');
  while (true) {
    stdout.write('곱할 두 숫자를 공백으로 띄워 입력해주세요.');
    String? input = stdin.readLineSync();

    if (input == 'end') {
      break;
    }

    List<String> nums = input!.split(' ');
    if (nums.length != 2) {
      print('잘못된 입력입니다. 다시 시도해주세요.');
      continue;
    }

    int? num1 = int.tryParse(nums[0]);
    int? num2 = int.tryParse(nums[1]);

    if (num1 == null || num2 == null) {
      print('값이 잘못되었습니다. 두 숫자만 입력해주세요.');
      continue;
    }

    print('$num1 * $num2= ${num1 * num2}');
  }
}

