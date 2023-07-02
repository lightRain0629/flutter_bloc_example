import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../blocs/blocExports.dart';
import '../modelTask/modelTask.dart';
import 'listTileTask.dart';

class TasksList extends StatelessWidget {
  final String centerText;

  const TasksList({
    super.key,
    required this.taskList, required this.centerText,
  });

  final List<Task> taskList;

  @override
  Widget build(BuildContext context) {
    if (taskList.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(centerText),
          ],
        ),
      );
    } else {
      return ListView.builder(
          itemCount: taskList.length,
          itemBuilder: (context, index) {
            var task = taskList[index];
            return ListTileTask(task: task);
          });
    }
  }
}
