import 'dart:io';

class Student {
  int id;
  int grade;
  String name;
  int age;
  String gender;
  String? hobby;

  Student({required this.id, required this.grade, required this.name, required this.age, required this.gender, this.hobby});

  @override
  String toString() {
    return 'ID: $id, Grade: $grade, Name: $name, Age: $age, Gender: $gender, Hobby: ${hobby ?? "None"}';
  }
}

void main() {
  var students = <Student>[];

  while(true) {
    print('Choose an option: ');
    print('add: Add student');
    print('delete: Delete student');
    print('search: Search student');
    print('select: Display students');
    print('end: End program');
    
    var option = stdin.readLineSync();
    if(option == "add") {
      print("Enter the ID of the student to add:");
      var id = int.parse(stdin.readLineSync()!);
      print("Enter the Grade of the student:");
      var grade = int.parse(stdin.readLineSync()!);
      print("Enter the Name of the student:");
      var name = stdin.readLineSync()!;
      print("Enter the Age of the student:");
      var age = int.parse(stdin.readLineSync()!);
      print("Enter the Gender of the student:");
      var gender = stdin.readLineSync()!;
      print("Enter the Hobby of the student (optional):");
      var hobby = stdin.readLineSync();
      students.add(Student(id: id, grade: grade, name: name, age: age, gender: gender, hobby: hobby));
      print("Student Added Successfully");
    } else if(option == "delete") {
      print("Enter the ID of the student to delete:");
      var id = int.parse(stdin.readLineSync()!);
      students.removeWhere((student) => student.id == id);
      print("Student Deleted Successfully");
    } else if(option == "search") {
      print("Enter the ID of the student to search:");
      var id = int.parse(stdin.readLineSync()!);
      var foundStudents = students.where((student) => student.id == id);
      if(foundStudents.isEmpty) {
        print("No student with ID $id found");
      } else {
        print("Found students: ");
        foundStudents.forEach((student) => print(student));
      }
    } else if(option == "select") {
      print("Enter the property (id, grade, name, age, gender, hobby) and value to select. Separate them with a space:");
      var selection = stdin.readLineSync()!.split(' ');
      if(selection.length != 2) {
        print("Invalid format. Please use the format 'property value'");
        continue;
      }
      var property = selection[0];
      var value = selection[1];
      var foundStudents = students.where((student) {
        switch(property) {
          case 'id':
            return student.id.toString() == value;
          case 'grade':
            return student.grade.toString() == value;
          case 'name':
            return student.name == value;
          case 'age':
            return student.age.toString() == value;
          case 'gender':
            return student.gender == value;
          case 'hobby':
            return student.hobby == value;
          default:
            return false;
        }
      });
      if(foundStudents.isEmpty) {
        print("No student with $property $value found");
      } else {
        print("Found students: ");
        foundStudents.forEach((student) => print(student));
      }
    } else if(option == "end") {
      break;
    } else {
      print("Unknown command. Please try again.");
    }
  }
}
