class Todo {
  final int created;
  final int date;
  final String title;
  final bool done;

  Todo({required this.created,
      required this.date,
      required this.title,
      required this.done});

  factory Todo.fromJson(Map<String, dynamic> json) {
    return Todo(
        created: json['created'],
        date: json['date'],
        title: json['title'],
        done: json['done']);
  }

  Todo copy({
    int? created,
    int? date,
    String? title,
    bool? done,
    String? message,
  }) {
    return Todo(
      created: created ?? this.created,
      date: date ?? this.date,
      title: title ?? this.title,
      done: done ?? this.done
    );
  }
}
