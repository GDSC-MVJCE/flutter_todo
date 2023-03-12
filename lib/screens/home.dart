import 'package:flutter/material.dart';
import 'package:flutter_todo/screens/addtodo.dart';
import 'package:flutter_todo/widgets/allToDos.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("All Todos")
      ),
      body: const AllToDos(),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add, size: 35),
        onPressed: () {
          Navigator.push(context,
            MaterialPageRoute(builder: (context) => const AddToDo()),
          );
        },
      ),
    );
  }
}

