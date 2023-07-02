import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc_example/UI/tasksInListOnline.dart';
import 'package:flutter_bloc_example/api/apiDeleteList.dart';
import 'package:flutter_bloc_example/api/apiGetList.dart';
import 'package:flutter_bloc_example/api/apiGetTaskFromList.dart';
import 'package:flutter_bloc_example/api/apiRenameList.dart';
import '../blocExample/model/taskListModel.dart';
import '../blocs/blocExports.dart';
import '../modelTask/modelTask.dart';
import '../widgets/listTileTask.dart';

class TasksListOnline extends StatefulWidget {
  final String centerText;

  const TasksListOnline({
    super.key,
    required this.taskList,
    required this.centerText,
  });

  final List<TaskListModel> taskList;

  @override
  State<TasksListOnline> createState() => _TasksListOnlineState();
}

class _TasksListOnlineState extends State<TasksListOnline> {
  @override
  Widget build(BuildContext context) {
    if (widget.taskList.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(widget.centerText),
          ],
        ),
      );
    } else {
      TextEditingController newTitleController = TextEditingController();

      return BlocBuilder<SwitchBloc, SwitchState>(
        builder: (context, state) {
          return ListView.builder(
              itemCount: widget.taskList.length,
              itemBuilder: (context, index) {
                var taskListOne = widget.taskList[index];
                return Dismissible(
                  onDismissed: (direction) {
                    DeleteTaskList.deleteTaskList(taskListOne.uuid);
                    setState(() {});
                  },
                  key: ValueKey(taskListOne),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.1,
                    margin: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: state.switchVal
                            ? Colors.purple[900]
                            : Colors.purple[100]),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ListTile(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => TasksInListPage(
                                          uuidList: taskListOne.uuid,
                                        )));
                          },
                          onLongPress: () {
                            showModalBottomSheet(
                                context: context,
                                builder: (context) => SingleChildScrollView(
                                      child: Container(
                                        padding: EdgeInsets.only(
                                            bottom: MediaQuery.of(context)
                                                .viewInsets
                                                .bottom),
                                        child: Container(
                                          padding: EdgeInsets.all(20),
                                          child: Column(
                                            children: [
                                              const Text(
                                                'Rename task',
                                                style: TextStyle(fontSize: 24),
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              SizedBox(
                                                height: 40,
                                                child: TextField(
                                                  style:
                                                      TextStyle(fontSize: 16),
                                                  autofocus: true,
                                                  controller:
                                                      newTitleController,
                                                  decoration: InputDecoration(
                                                    contentPadding:
                                                        const EdgeInsets
                                                                .symmetric(
                                                            vertical: 35,
                                                            horizontal: 20),
                                                    label: Text('New title'),
                                                    border: OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(30)),
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
                                                        Navigator.pop(context),
                                                  ),
                                                  TextButton(
                                                      onPressed: () {
                                                        RenameTaskList()
                                                            .renameTaskList(
                                                                taskListOne
                                                                    .uuid,
                                                                newTitleController
                                                                    .text);
                                                        setState(() {});
                                                        Navigator.pop(context);
                                                      },
                                                      child: Text('Rename')),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ));
                          },
                          title: Text(taskListOne.name),
                          trailing: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Task count:  ' + taskListOne.taskCount),
                              Text('Task completed: ' +
                                  taskListOne.completedTaskCount)
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              });
        },
      );
    }
  }
}
