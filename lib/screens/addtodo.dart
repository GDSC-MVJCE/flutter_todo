import 'package:flutter/material.dart';
import 'package:flutter_todo/widgets/ButtonWidget.dart';

class AddToDo extends StatelessWidget {
  const AddToDo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final textController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Add New ToDo")
      ),
      body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //text form field -> for more text fields
              //on change
              TextField(
                //onChanged
                decoration: InputDecoration(
                  hintText: "Add your todo here",
                    border: const OutlineInputBorder(),
                  suffixIcon: IconButton(
                      onPressed: () {
                        textController.clear();
                      },
                      icon: const Icon(Icons.clear),
                  )
                ),
              ),
              const SizedBox(height: 20),
              const Button(),
            ],
          ),
        ),
      );
  }
}
