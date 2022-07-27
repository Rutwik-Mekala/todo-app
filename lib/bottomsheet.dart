import 'package:flutter/material.dart';
import 'package:quickbuck/taskData.dart';
import 'package:provider/provider.dart';

class Bottom_Sheet extends StatelessWidget {
  final textcontroller = TextEditingController();
  String newText = '';

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      height: 400,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Add Task',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.lightBlueAccent, fontSize: 30),
          ),
          TextField(
            controller: textcontroller,
            textAlign: TextAlign.center,
            keyboardType: TextInputType.text,
            textCapitalization: TextCapitalization.sentences,
            onChanged: (value) {
              newText = value;
            },
          ),
          TextButton(
            style: TextButton.styleFrom(
              backgroundColor: Colors.lightBlueAccent,
            ),
            onPressed: () {
              Provider.of<TaskData>(context, listen: false).addNewTask(newText);
              Navigator.pop(context);
              textcontroller.clear();
            },
            child: Text(
              'ADD',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }
}
