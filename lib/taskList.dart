import 'package:flutter/material.dart';
import 'package:quickbuck/taskData.dart';
import 'package:quickbuck/tasktile.dart';
import 'package:quickbuck/task.dart';
import 'package:provider/provider.dart';

class TaskList extends StatelessWidget {
  TaskList({required this.taskList});

  List<Task> taskList;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      itemBuilder: (context, index) {
        final task = Provider.of<TaskData>(context).taskList[index];
        return Dismissible(
          key: UniqueKey(),
          background: Container(color: Colors.red),
          onDismissed: (direction) {
            Provider.of<TaskData>(context, listen: false).deleteTask(task);
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('${task.name} dismissed')));
          },
          child: TaskTile(
            text: task.name,
            check: task.isDone,
            checkBoxCallBack: () {
              Provider.of<TaskData>(context, listen: false).updateTask(task);
            },
          ),
        );
      },
      itemCount: Provider.of<TaskData>(context).listLength,
    );
  }
}
