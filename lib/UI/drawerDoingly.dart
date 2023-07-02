import 'package:flutter/material.dart';
import 'package:flutter_bloc_example/UI/recycleScreen.dart';
import 'package:flutter_bloc_example/UI/tasks_screen.dart';
import 'package:flutter_bloc_example/widgets/tasksList.dart';

import '../blocs/blocExports.dart';

class DrawerDoingly extends StatelessWidget {
  const DrawerDoingly({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.045,
            ),
            Row(
              children: [
                Text(
                  'Doingly',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ],
            ),
            BlocBuilder<TaskBloc, TaskState>(
              builder: (context, state) {
                return GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: ListTile(
                    leading: Icon(Icons.folder_special),
                    title: Text('My tasks list'),
                    trailing: Text(state.allTasks.length.toString()),
                  ),
                );
              },
            ),
            Divider(),
            BlocBuilder<TaskBloc, TaskState>(
              builder: (context, state) {
                return GestureDetector(
                  onTap: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => RecycleScreen())),
                  child: ListTile(
                    leading: Icon(Icons.delete),
                    title: Text('Offline Bin folder'),
                    trailing: Text(state.removedTasks.length.toString()),
                  ),
                );
              },
            ),
            BlocBuilder<TaskBloc, TaskState>(
              builder: (context, state) {
                return GestureDetector(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => TasksScreen())),
                  child: ListTile(
                    leading: Icon(Icons.task),
                    title: Text('Offline tasks'),
                    trailing: Text(state.allTasks.length.toString()),
                  ),
                );
              },
            ),
            BlocBuilder<SwitchBloc, SwitchState>(
              builder: (context, state) {
                return Row(
                  children: [
                    Text(state.switchVal
                        ? 'Change to light mode'
                        : 'Change to dark mode'),
                    SizedBox(
                      width: 50,
                    ),
                    Switch(
                        value: state.switchVal,
                        onChanged: (newVal) {
                          newVal
                              ? context.read<SwitchBloc>().add(SwitchOnEvent())
                              : context
                                  .read<SwitchBloc>()
                                  .add(SwitchOffEvent());
                        }),
                  ],
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
