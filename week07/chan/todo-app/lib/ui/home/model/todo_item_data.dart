class ToDoItemData {
  final String created;
  final String date;
  final String title;
  final String done;

  ToDoItemData(this.created, this.date, this.title, this.done);

  ToDoItemData.fromJson(Map<String, dynamic> json)
      : created = json['created'],
        date = json['date'],
        title = json['title'],
        done = json['done'];

  Map<String, dynamic> toJson() => {
        'created': created,
        'date': date,
        'title': title,
        'done': done,
      };
}
