import 'package:flutter/material.dart';
import 'package:flutter_bloc_example/UI/drawerDoingly.dart';
import 'package:flutter_bloc_example/UI/profileScreen.dart';
import '../blocExample/bloc/navigation_bloc.dart';
import '../blocs/blocExports.dart';
import '../modelTask/modelTask.dart';
import '../widgets/tasksList.dart';
import 'addTaskScreen.dart';

class TasksScreen extends StatefulWidget {
  TasksScreen({Key? key}) : super(key: key);

  static const id = 'taskScreen';

  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  void _addTask(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (context) => SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                child: AddTaskScreen(),
              ),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationBloc, NavigationState>(
      builder: (contextNav, stateNav) {
        return BlocBuilder<TaskBloc, TaskState>(
          builder: (context, state) {
            List<Task> taskList = state.allTasks;
            List pages = [
              TasksList(
                taskList: taskList,
                centerText: 'You have not any offline tasks.',
              ),
              ProfileScreen()
            ];
            return Scaffold(
              // drawer: DrawerDoingly(),
              appBar: AppBar(
                title: const Text('Doingly offline'),
                actions: [
                  IconButton(
                    onPressed: () => _addTask(context),
                    icon: const Icon(Icons.add),
                  )
                ],
              ),
              body: pages[stateNav.count],
              floatingActionButton: FloatingActionButton(
                onPressed: () => _addTask(context),
                tooltip: 'Add Task',
                child: const Icon(Icons.add),
              ),
              // bottomNavigationBar: SizedBox(
              //   height: 92,
              //   child: BlocBuilder<SwitchBloc, SwitchState>(
              //     builder: (context, state) {
              //       return BottomNavigationBar(
              //                     currentIndex: stateNav.count,
              //                           onTap: (value) {
              //                             context.read<NavigationBloc>().add(OnTapEvent(index: value));
              //                           },
              //                           selectedItemColor: state.switchVal ? Colors.purple[800] : Colors.purple[200],
              //                           unselectedItemColor: state.switchVal ? Colors.white : Colors.black,
              //                           items: [
              //                             BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
              //                             BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
              //                           ]);
              //     },
              //   ),
              // ),
            );
          },
        );
      },
    );
  }
}
