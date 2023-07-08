class TodoResponse {
  final int? created;
  final int? date;
  final String? title;
  final bool? done;
  final String? message;

  TodoResponse({required this.created,
      required this.date,
      required this.title,
      required this.done,
      required this.message
  });

  factory TodoResponse.fromJson(Map<String, dynamic> json) {
    return TodoResponse(
        created: json['created'],
        date: json['date'],
        title: json['title'],
        done: json['done'],
        message: json['message']);
  }
}
