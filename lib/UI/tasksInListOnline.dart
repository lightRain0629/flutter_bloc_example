import 'package:flutter/material.dart';
import 'package:flutter_bloc_example/api/apiChangeNameOfTask.dart';
import 'package:flutter_bloc_example/api/apiDeleteTask.dart';
import 'package:flutter_bloc_example/api/apiGetTaskFromList.dart';
import '../api/apiChangeValTask.dart';
import '../api/apiPostTask.dart';
import '../blocExample/model/tasksOnlineModel.dart';
import '../blocs/blocExports.dart';
import '../blocs/switchBloc/switch_bloc.dart';

class TasksInListPage extends StatefulWidget {
  const TasksInListPage({super.key, required this.uuidList});

  final String uuidList;

  @override
  State<TasksInListPage> createState() => _TasksInListPageState();
}

class _TasksInListPageState extends State<TasksInListPage> {
  @override
  Widget build(BuildContext context) {
    TextEditingController taskTitleController = TextEditingController();
    TextEditingController newTaskTitleController = TextEditingController();

    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () => showModalBottomSheet(
              context: context,
              builder: (context) => SingleChildScrollView(
                    child: Container(
                      padding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).viewInsets.bottom),
                      child: Container(
                        padding: EdgeInsets.all(20),
                        child: Column(
                          children: [
                            const Text(
                              'Add Task',
                              style: TextStyle(fontSize: 24),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            SizedBox(
                              height: 40,
                              child: TextField(
                                style: TextStyle(fontSize: 16),
                                autofocus: true,
                                controller: taskTitleController,
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.symmetric(
                                      vertical: 35, horizontal: 20),
                                  label: Text('Title'),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30)),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                TextButton(
                                  child: const Text(
                                    'Cancel',
                                  ),
                                  onPressed: () => Navigator.pop(context),
                                ),
                                TextButton(
                                    onPressed: () {
                                      PostTask().postTask(
                                          taskTitleController.text,
                                          false,
                                          widget.uuidList);
                                      setState(() {});
                                      Navigator.pop(context);
                                    },
                                    child: Text('Add')),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  )),
          tooltip: 'Add Task',
          child: const Icon(Icons.add),
        ),
        appBar: AppBar(
          title: Text('Tasks'),
        ),
        body: BlocBuilder<SwitchBloc, SwitchState>(
          builder: (context, state) {
            return FutureBuilder(
                future: GetTasksFromList().getTaskFromList(widget.uuidList),
                builder: (context, snapshotTask) {
                  if (snapshotTask.hasData) {
                    final List<TasksOnline> tasks = snapshotTask.data!;
                    if (tasks.isEmpty) {
                      return Center(
                        child: Text('You have not any tasks'),
                      );
                    } else {
                      return ListView.builder(
                          itemCount: tasks.length,
                          itemBuilder: (context, index) {
                            final task = tasks[index];
                            return Dismissible(
                              onDismissed: (direction) {
                                DeleteTaskOnline().deleteTask(task.uuid);
                                setState(() {});
                              },
                              key: ValueKey(task),
                              child: Container(
                                margin: EdgeInsets.symmetric(
                                    vertical: 8, horizontal: 8),
                                decoration: BoxDecoration(
                                  color: state.switchVal
                                      ? Colors.purple[900]
                                      : Colors.purple[50],
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: ListTile(
                                    title: Text(
                                      task.text.toString(),
                                      // style: TextStyle(
                                      //     decoration: task.isDone!
                                      //         ? TextDecoration.lineThrough
                                      //         : null),
                                    ),
                                    trailing: Checkbox(
                                      // value: task.isDone,
                                      value: task.completed,
                                      // onChanged: task.isDeleted == false
                                      //     ? (value) {
                                      //         context
                                      //             .read<TaskBloc>()
                                      //             .add(UpdateTask(task: task));
                                      //       }
                                      //     : null
                                      onChanged: (value) {
                                        ChangeValTask().changeValTask(task.uuid,
                                            task.text, value!, widget.uuidList);
                                        setState(() {});
                                      },
                                    ),
                                    onLongPress: () {
                                      showModalBottomSheet(
                                          context: context,
                                          builder: (context) =>
                                              SingleChildScrollView(
                                                child: Container(
                                                  padding: EdgeInsets.only(
                                                      bottom:
                                                          MediaQuery.of(context)
                                                              .viewInsets
                                                              .bottom),
                                                  child: Container(
                                                    padding: EdgeInsets.all(20),
                                                    child: Column(
                                                      children: [
                                                        const Text(
                                                          'Rename task',
                                                          style: TextStyle(
                                                              fontSize: 24),
                                                        ),
                                                        const SizedBox(
                                                          height: 10,
                                                        ),
                                                        SizedBox(
                                                          height: 40,
                                                          child: TextField(
                                                            style: TextStyle(
                                                                fontSize: 16),
                                                            autofocus: true,
                                                            controller:
                                                                newTaskTitleController,
                                                            decoration:
                                                                InputDecoration(
                                                              contentPadding:
                                                                  const EdgeInsets
                                                                          .symmetric(
                                                                      vertical:
                                                                          35,
                                                                      horizontal:
                                                                          20),
                                                              label: Text(
                                                                  'New title'),
                                                              border: OutlineInputBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              30)),
                                                            ),
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                          height: 5,
                                                        ),
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceEvenly,
                                                          children: [
                                                            TextButton(
                                                              child: const Text(
                                                                'Cancel',
                                                              ),
                                                              onPressed: () =>
                                                                  Navigator.pop(
                                                                      context),
                                                            ),
                                                            TextButton(
                                                                onPressed: () {
                                                                  ChangeTaskName()
                                                                      .changeTaskName(
                                                                    task.uuid,
                                                                    newTaskTitleController
                                                                        .text,
                                                                    task.completed,
                                                                    widget
                                                                        .uuidList,
                                                                  );
                                                                  setState(
                                                                      () {});
                                                                  Navigator.pop(
                                                                      context);
                                                                },
                                                                child: Text(
                                                                    'Rename')),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ));
                                    }

                                    // => context.read<TaskBloc>().add(DeleteTask(task: task)),
                                    ),
                              ),
                            );
                          });
                    }
                  } else {
                    return Center(child: CircularProgressIndicator());
                  }
                });
          },
        ));
  }
}
