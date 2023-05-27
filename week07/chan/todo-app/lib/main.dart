import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:network/ui/home/model/todo_item_response.dart';
import 'package:network/ui/home/state/todo_item.dart';

import 'basic_main.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

void getMethod() async {
  print("getMethod");
  try {
    final response = await http.get(Uri.parse('https://script.google.com/macros/s/AKfycbwGA-xVvp-T2P2lnQUZYAzebSBmimR9CFsg3iOyRwCNzgclnh4sk9nt7QgfCbjI6ihe/exec'));
    print("${response.statusCode}: ${response.body}");

    Map responseJson = jsonDecode(response.body);
    var user = ToDoItem.fromJson(json);
  } catch (e) {
    print(e);
  }
}

void postMethod() async {
  print("postMethod");
  try {
    final response = await http.post(
        Uri.parse('https://script.google.com/macros/s/AKfycby4QJ4-nVVcw4zgqVUCV8XrWAB3EljJzh__bjvMASCg6QEBWOn17KOHnuiTMkoeu5sJ/exec'),
        body: {
          "created": "22551253",
          "date": "12551231",
          "title": "a222",
          "done": "true"
        }
    );
    print("${response.statusCode}: ${response.body}");
  } catch (e) {
    print(e.toString());
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}