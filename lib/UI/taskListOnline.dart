import 'package:flutter/material.dart';
import 'package:flutter_bloc_example/UI/drawerDoingly.dart';
import 'package:flutter_bloc_example/UI/profileScreen.dart';
import 'package:flutter_bloc_example/UI/taskScreenOnline.dart';
import 'package:flutter_bloc_example/api/apiGetList.dart';
import 'package:flutter_bloc_example/blocExample/model/taskListModel.dart';
import 'package:flutter_bloc_example/storageTest/storageTest.dart';
import '../api/apiPostList.dart';
import '../blocExample/bloc/navigation_bloc.dart';
import '../blocs/blocExports.dart';
import '../modelTask/modelTask.dart';
import '../widgets/tasksList.dart';
import 'addTaskScreen.dart';
import 'addTaskScreenOnline.dart';

class TasksScreenOnline extends StatefulWidget {
  TasksScreenOnline({Key? key}) : super(key: key);

  static const id = 'taskScreenOnline';

  @override
  State<TasksScreenOnline> createState() => _TasksScreenOnlineState();
}

TextEditingController titleController = TextEditingController();

class _TasksScreenOnlineState extends State<TasksScreenOnline> {
  void _addTask(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (context) => SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                child: AddTaskScreenOnline(),
              ),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationBloc, NavigationState>(
      builder: (contextNav, stateNav) {
        return FutureBuilder<List<TaskListModel>>(
            future: GetTaskList.getTaskList(),
            builder: (BuildContext contextFuture, AsyncSnapshot snapshotTask) {
              // final List<TaskListModel> taskLists = [
              //   TaskListModel(
              //     name: 'Add list',
              //     uuid: 'lahdf',
              //     taskCount: 2,
              //     completedTaskCount: 1,
              //   )
              // ];

              if (snapshotTask.hasData) {
                final List<TaskListModel> taskLists = snapshotTask.data!;

                print(userData);
                List pages = [
                  TasksListOnline(
                    taskList: taskLists,
                    centerText: 'You have not any tasks.',
                  ),
                  ProfileScreen()
                ];
                print(snapshotTask.data);
                return Scaffold(
                  resizeToAvoidBottomInset: false,
                  drawer: DrawerDoingly(),
                  appBar: AppBar(
                    title: const Text('Doingly'),
                    // actions: [
                    //   IconButton(
                    //     onPressed: () => _addTask(context),
                    //     icon: const Icon(Icons.add),
                    //   )
                    // ],
                  ),
                  body: pages[stateNav.count],
                  floatingActionButton: FloatingActionButton(
                    onPressed: () => showModalBottomSheet(
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
                                      Text(
                                        'Add Task',
                                        style: TextStyle(fontSize: 24),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      SizedBox(
                                        height: 40,
                                        child: TextField(
                                          style: TextStyle(fontSize: 16),
                                          autofocus: true,
                                          controller: titleController,
                                          decoration: InputDecoration(
                                            contentPadding:
                                                EdgeInsets.symmetric(
                                                    vertical: 35,
                                                    horizontal: 20),
                                            label: Text('Title'),
                                            border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(30)),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          TextButton(
                                            child: Text(
                                              'Cancel',
                                            ),
                                            onPressed: () =>
                                                Navigator.pop(context),
                                          ),
                                          TextButton(
                                              onPressed: () {
                                                PostTaskList.postTaskList(
                                                    titleController.text);
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
                  bottomNavigationBar: SizedBox(
                    height: 92,
                    child: BlocBuilder<SwitchBloc, SwitchState>(
                      builder: (context, state) {
                        return BottomNavigationBar(
                            currentIndex: stateNav.count,
                            onTap: (value) {
                              context
                                  .read<NavigationBloc>()
                                  .add(OnTapEvent(index: value));
                            },
                            selectedItemColor: state.switchVal
                                ? Colors.purple[800]
                                : Colors.purple[200],
                            unselectedItemColor:
                                state.switchVal ? Colors.white : Colors.black,
                            items: [
                              BottomNavigationBarItem(
                                  icon: Icon(Icons.home), label: 'Home'),
                              BottomNavigationBarItem(
                                  icon: Icon(Icons.person), label: 'Profile'),
                            ]);
                      },
                    ),
                  ),
                );
              } else {
                return Scaffold(
                    body: Column(
                  children: [
                    Center(child: CircularProgressIndicator()),
                  ],
                ));
              }
            });
      },
    );
  }
}
