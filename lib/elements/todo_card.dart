import 'package:flutter/material.dart';
import 'package:project/elements/custom_text.dart';
import 'package:project/models/todos.dart';

class TodoCard extends StatefulWidget {
  TodoCard({Key? key, required this.todo}) : super(key: key);
  final Todos todo;

  @override
  _TodoCardState createState() => _TodoCardState();
}

class _TodoCardState extends State<TodoCard> {
  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      title: CustomText(text: 'Name'),
      activeColor: Theme.of(context).primaryColor,
      value: true,
      onChanged: (value) {
        setState(() {
          value = !value;
        });
      },
    );
  }
}
