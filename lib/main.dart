import 'package:flutter/material.dart';
import 'package:todo_uygulamasi/pages/todo_list_page.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 2,
        child: TodoListPage()),
    );

  }
}
