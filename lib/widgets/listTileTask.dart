import 'package:flutter/material.dart';

import '../blocs/blocExports.dart';
import '../modelTask/modelTask.dart';

class ListTileTask extends StatelessWidget {
  const ListTileTask({
    super.key,
    required this.task,
  });

  final Task task;

  void removeOrDelete(BuildContext ctx, Task task) {
    task.isDeleted!
        ? ctx.read<TaskBloc>().add(DeleteTask(task: task))
        : ctx.read<TaskBloc>().add(RemoveTask(task: task));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SwitchBloc, SwitchState>(
      builder: (context, state) {
        return Dismissible(
          onDismissed: (direction) {
            removeOrDelete(context, task);
          },
          key: ValueKey(task),
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
            decoration: BoxDecoration(
              color: state.switchVal ? Colors.purple[900] : Colors.purple[50],
              borderRadius: BorderRadius.circular(20),
            ),
            child: ListTile(
                title: Text(
                  task.title,
                  style: TextStyle(
                      decoration:
                          task.isDone! ? TextDecoration.lineThrough : null),
                ),
                trailing: Checkbox(
                    value: task.isDone,
                    onChanged: task.isDeleted == false
                        ? (value) {
                            context
                                .read<TaskBloc>()
                                .add(UpdateTask(task: task));
                          }
                        : null),
                onLongPress: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text('Do you want delete this task?'),
                          actions: [
                            TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text('No')),
                            TextButton(
                                onPressed: () {
                                  removeOrDelete(context, task);
                                  Navigator.pop(context);
                                },
                                child: Text('Yes'))
                          ],
                        );
                      });
                }

                // => context.read<TaskBloc>().add(DeleteTask(task: task)),
                ),
          ),
        );
      },
    );
  }
}
