import 'package:network/ui/home/model/todo_item_data.dart';

class ToDoItemResponse {
  final List<ToDoItemData> items;

  ToDoItemResponse(this.items);

  ToDoItemResponse.fromJson(Map<String, dynamic> json)
      : items = json['items'];

  Map<String, dynamic> toJson() => {
        'items': items,
  };
}
