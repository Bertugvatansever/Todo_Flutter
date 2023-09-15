import 'package:flutter/material.dart';
import 'package:todo_uygulamasi/pages/todo_page.dart';

import '../data/todo_service.dart';
import '../models/todo.dart';

class TodoListPage extends StatefulWidget {
  const TodoListPage({super.key});

  @override
  State<TodoListPage> createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  TodoService service = TodoService.instance;
  List<Todo> todos = [];
  List<Todo> doneTodos = [];

  @override
  void initState() {
    loadData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("To Do Uygulamasi"),
        centerTitle: true,
        bottom: TabBar(
          tabs: [
            Tab(
              icon: Icon(Icons.check_box_outline_blank),
            ),
            Tab(
              icon: Icon(Icons.check),
            )
          ],
          ),
      ),
      body: TabBarView(
        children: [
          getTodoList(todos),
          getTodoList(doneTodos)
        ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context,MaterialPageRoute(builder: (_)=> TodoPage())).then((value) => loadData());
          },
          child: Icon(Icons.add),),
    );
  }
  
  getTodoList(List<Todo> todos) {
    return ListView.builder(
      itemCount:todos.length,
      itemBuilder:(context,index){
        // Liste elemanlarını görsel olarak güzelleştirme imkanları sunan widget
        return Card(
          child:  ListTile(
          title: Text(todos[index].title!),
          subtitle: Text(todos[index].description!) ,    
          trailing: Checkbox(onChanged: (value) {
            todos[index].isDone = value;
            service.updateIsDone(todos[index]).then((value) => loadData());
          }, value:todos[index].isDone),
        ),
        );
      },);
  }
  loadData(){
    service.getTodos(false).then((value){
      setState(() {
        todos=value;
      });    
    });
    service.getTodos(true).then((value){
      setState(() {
        doneTodos=value;
      });    
    });
  }
}