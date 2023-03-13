import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import './addtodo.dart';
import '../models/todo.dart';
import '../utils/db.dart';
import '../widgets/TaskWidget.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final Stream<QuerySnapshot> _todosStream = db.collection('todos').snapshots();

  // late List<Todo> todos = [];
  //
  // void getUpdatedTodos() {
  //   db.collection("todos").get().then(
  //     (querySnapshot) {
  //       List<Todo> temp = [];
  //
  //       for (var docSnapshot in querySnapshot.docs) {
  //         String todoTitle = docSnapshot.data()["title"];
  //         temp.add(Todo(id: docSnapshot.id, title: todoTitle));
  //       }
  //
  //       setState(() {
  //         todos = temp;
  //       });
  //     },
  //     onError: (e) => print("Error completing: $e"),
  //   );
  // }

  // @override
  // void initState() {
  //   getUpdatedTodos();
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("All Todos")),
      body: Container(
          padding: const EdgeInsets.all(20),
          child: StreamBuilder<QuerySnapshot>(
            stream: _todosStream,
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasError) {
                return const Text('Something went wrong');
              }

              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              return ListView(
                children: snapshot.data!.docs
                    .map((DocumentSnapshot document) {
                      Map<String, dynamic> todo =
                          document.data()! as Map<String, dynamic>;
                      return TodoWidget(
                          todo: Todo(
                        id: document.id,
                        title: todo["title"],
                      ));
                    })
                    .toList()
                    .cast(),
              );
            },
          )
          // ListView.builder(
          //   scrollDirection: Axis.vertical,
          //   itemCount: todos.length,
          //   itemBuilder: (BuildContext context, int index) {
          //     return TodoWidget(todo: todos[index]);
          //   },
          // ),
          ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add, size: 35),
        onPressed: () => Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const AddToDo(),
          ),
        ),
      ),
    );
  }
}
