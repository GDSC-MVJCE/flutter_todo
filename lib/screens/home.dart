import 'package:flutter/material.dart';

import '../models/todo.dart';
import '../screens/addtodo.dart';
import '../widgets/TaskWidget.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Todo> todos = [
    Todo(id: "1", title: "Clean house"),
    Todo(id: "2", title: "Study"),
    Todo(id: "3", title: "Go College"),
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
      body: Container(
        padding: const EdgeInsets.all(20),
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: todos.length,
          itemBuilder: (BuildContext context, int index) {
            return TodoWidget(
              index: index,
              removeTodo: removeTodo,
              todo: todos[index],
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add, size: 35),
        onPressed: () async {
          String title = await Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const AddToDo(),
            ),
          );

          setState(() {
            todos.add(
              Todo(
                id: (int.parse(todos.last.id) + 1).toString(),
                title: title,
              ),
            );
          });
        },
      ),
    );
  }
}
