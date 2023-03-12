import 'package:flutter/material.dart';

import '../models/todo.dart';
import '../screens/addtodo.dart';
import '../widgets/allToDos.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Todo> todos = [
    Todo(title: "Clean house"),
    Todo(title: "Study"),
    Todo(title: "Go College"),
  ];

  void removeTodo(int index) {
    setState(() {
      todos.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("All Todos")),
      body: AllToDos(todos: todos, removeTodo: removeTodo),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add, size: 35),
        onPressed: () async {
          Todo todo = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AddToDo(),
            ),
          );

          setState(() {
            todos.add(todo);
          });
        },
      ),
    );
  }
}
