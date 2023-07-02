import 'package:flutter/material.dart';
import 'package:flutter_bloc_example/UI/drawerDoingly.dart';
import 'package:flutter_bloc_example/widgets/tasksList.dart';

import '../blocs/blocExports.dart';
import '../modelTask/modelTask.dart';

class RecycleScreen extends StatelessWidget {
  const RecycleScreen({super.key});

  static const id = 'recycleScreen';

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskBloc, TaskState>(
      builder: (context, state) {
        return Scaffold(
          // drawer: DrawerDoingly(),
          appBar: AppBar(
            title: const Text('Recycle Bin'),
            // actions: [
            //   IconButton(
            //     onPressed: () {},
            //     icon: const Icon(Icons.add),
            //   )
            // ],
          ),
          body: TasksList(
            taskList: state.removedTasks,
            centerText: 'Recycle Bin is empty.',
          ),
        );
      },
    );
  }
}
