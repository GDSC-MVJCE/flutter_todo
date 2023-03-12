import 'package:flutter/material.dart';

class TodoWidget extends StatelessWidget {

  final String title;

  const TodoWidget({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 6.0,
              spreadRadius: 3.0,
              offset: Offset(7, 3)
            )
          ]
        ),
        padding: const EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title, style: const TextStyle(fontSize: 20, color: Colors.white),),
            const Icon(Icons.delete, color: Colors.white,)
          ],
        ),
      ),
    );
  }
}
