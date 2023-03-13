import 'package:flutter/material.dart';

import '../utils/db.dart';

class AddToDo extends StatefulWidget {
  const AddToDo({Key? key}) : super(key: key);

  @override
  State<AddToDo> createState() => _AddToDoState();
}

class _AddToDoState extends State<AddToDo> {
  String? todo;

  @override
  Widget build(BuildContext context) {
    final textController = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Text("Add New ToDo")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              onChanged: (val) {
                print(val);
                setState(() => todo = val);
              },
              decoration: InputDecoration(
                hintText: "Add your todo here",
                border: const OutlineInputBorder(),
                suffixIcon: IconButton(
                  onPressed: () => textController.clear(),
                  icon: const Icon(Icons.clear),
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (todo != null) {
                  final todoJson = <String, dynamic>{"title": todo};

                  db.collection("todos").add(todoJson).then((doc) {
                    debugPrint('DocumentSnapshot added with ID: ${doc.id}');
                    Navigator.of(context).pop();
                  });
                }
              },
              child: const Text("Submit"),
            ),
          ],
        ),
      ),
    );
  }
}
