import 'package:flutter/material.dart';
import 'package:flutter_todo/models/todo.dart';

class TodoWidget extends StatefulWidget {
  final int index;
  final Todo todo;
  final Function removeTodo;

  const TodoWidget({
    Key? key,
    required this.todo,
    required this.index,
    required this.removeTodo,
  }) : super(key: key);

  @override
  State<TodoWidget> createState() => _TodoWidgetState();
}

class _TodoWidgetState extends State<TodoWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 6.0,
            spreadRadius: 3.0,
            offset: Offset(7, 3),
          )
        ],
      ),
      padding: const EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            widget.todo.title,
            style: const TextStyle(fontSize: 20, color: Colors.white),
          ),
          IconButton(
            onPressed: () => widget.removeTodo(widget.index),
            icon: const Icon(
              Icons.delete,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
