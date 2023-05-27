import 'package:flutter/material.dart';

class ToDoItem extends StatelessWidget {
  const ToDoItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: const ListTile(
            onTap: null,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            tileColor: Colors.white,
            leading: Icon(
              Icons.check_box_outline_blank,
              color: Colors.lightBlue,
            ),
            title: Text(
              'Check Mail',
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  decoration: TextDecoration.lineThrough),
            )));
  }
}
