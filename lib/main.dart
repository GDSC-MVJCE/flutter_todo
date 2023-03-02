import 'package:flutter/material.dart';
import 'screens/home.dart';
import 'screens/addtodo.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "ToDo Application",
      home: Home(),
    );
  }
}
