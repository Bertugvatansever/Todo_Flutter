import 'package:flutter/material.dart';
import 'package:todo_uygulamasi/data/todo_service.dart';
import 'package:todo_uygulamasi/models/todo.dart';

class TodoPage extends StatelessWidget {
  TodoService todoService = TodoService.instance;
  final titleController = TextEditingController();
  final descController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final saveButton = TextButton(
      onPressed: (){
        todoService.addTodo(
          Todo(
            id:null,title: titleController.text,description: descController.text,isDone:false)
            ).then((value) => Navigator.pop(context));
      },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
        foregroundColor: MaterialStateProperty.all<Color>(Colors.white)

      ),
      child: Text("Save")
      );
    final titlefield = TextFormField(
      controller: titleController,
      decoration:InputDecoration(
        border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10))),
    );
    final descriptionfield = TextFormField(
      controller: descController,
      maxLines: 5,
      decoration:InputDecoration(
        border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10))),
    ); 
    return Scaffold(
      appBar: AppBar(
        title: Text("Yeni Yapilacaklar Sayfasi"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: titlefield,
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: descriptionfield,
          ),
          saveButton
        ],
      ),
    );
  }
}