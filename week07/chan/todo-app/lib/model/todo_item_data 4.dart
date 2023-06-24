class Todo {
  final int created;
  final int date;
  final String title;
  final bool done;

  Todo({required this.created, required this.date, required this.title, required this.done});

  factory Todo.fromJson(Map<String, dynamic> json) {
    return Todo(
      created: json['created'],
      date: json['date'],
      title: json['title'],
      done: json['done'],
    );
  }
}