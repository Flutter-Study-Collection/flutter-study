

import 'package:basic_widget/widget_example_page.dart';
import 'package:flutter/material.dart';

class WidgetListPage extends StatelessWidget {
  final List<String> widgets = [
    'Container',
    'Scaffold',
    'Column and Row',
    'Stack',
    'SingleChildScrollView',
    'ListView and ListTile',
    'GridView',
    'Center',
    'Align',
    'Padding',
    'Margin',
    'Expanded',
    'Card',
    'ElevatedButton', // RaisedButton is deprecated
    'TextButton', // FlatButton is deprecated
    'IconButton',
    'FloatingActionButton',
    'Image',
    'Icon',
    'CircleAvatar',
    'ProgressIndicator',
    'PageView',
    'BottomNavigationBar',
    'AppBar',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Widget Examples'),
      ),
      body: ListView.builder(
        itemCount: widgets.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(widgets[index]),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => WidgetExamplePage(widgets[index])),
              );
            },
          );
        },
      ),
    );
  }
}

