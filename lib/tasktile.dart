import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  TaskTile({
    required this.text,
    this.check,
    required this.checkBoxCallBack,
  });
  final String text;
  bool? check;
  final Function checkBoxCallBack;

  @override
  Widget build(BuildContext context) {
    return ListTile(
        title: Text(
          text,
          style: TextStyle(
            decoration: check! ? TextDecoration.lineThrough : null,
            fontSize: 21,
          ),
        ),
        trailing: Checkbox(
          activeColor: Colors.lightBlueAccent,
          value: check,
          onChanged: (newVal) {
            checkBoxCallBack();
          },
        ));
  }
}
