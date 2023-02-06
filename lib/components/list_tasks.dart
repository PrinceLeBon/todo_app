import 'package:flutter/material.dart';
import 'package:todo_app/widgets/tasks.dart';

class List_Tasks extends StatelessWidget {
  const List_Tasks({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 20,
        itemBuilder: (context, index){
      return const Tasks();
    });
  }
}
