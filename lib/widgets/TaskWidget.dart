import 'package:flutter/material.dart';

class TodoWidget extends StatelessWidget {
  const TodoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
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
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Text("Eat food", style: TextStyle(fontSize: 20, color: Colors.white),),
            Icon(Icons.delete, color: Colors.white,)
          ],
        ),
      ),
    );
  }
}
