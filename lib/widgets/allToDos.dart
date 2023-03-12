import 'package:flutter/material.dart';
import 'package:flutter_todo/models/todo.dart';
import 'package:flutter_todo/widgets/TaskWidget.dart';

class AllToDos extends StatefulWidget {
  const AllToDos({Key? key}) : super(key: key);

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
        itemCount: todos.length,
        itemBuilder: (BuildContext context, int index){
          return TodoWidget(title: todos[index].title);
        },
      ),
    );
  }
}
