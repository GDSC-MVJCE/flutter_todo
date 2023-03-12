import 'package:flutter/material.dart';
import 'package:flutter_todo/models/todo.dart';
import 'package:flutter_todo/widgets/TaskWidget.dart';

class AllToDos extends StatefulWidget {
  final List<Todo> todos;
  final Function removeTodo;

  const AllToDos({
    Key? key,
    required this.todos,
    required this.removeTodo,
  }) : super(key: key);

  @override
  State<AllToDos> createState() => _AllToDosState();
}

class _AllToDosState extends State<AllToDos> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: widget.todos.length,
        itemBuilder: (BuildContext context, int index) {
          return TodoWidget(
            index: index,
            removeTodo: widget.removeTodo,
            title: widget.todos[index].title,
          );
        },
      ),
    );
  }
}
