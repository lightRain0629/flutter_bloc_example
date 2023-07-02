import 'package:flutter/material.dart';
import '../blocs/blocExports.dart';
import '../modelTask/modelTask.dart';

class AddTaskScreen extends StatefulWidget {


  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
        TextEditingController titleController = TextEditingController();


        @override
  void dispose() {
    // TODO: implement dispose
    titleController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          Text('Add Task', style: TextStyle(fontSize: 24),),
          SizedBox(height: 10,),
          SizedBox(
            height: 40,
            child: TextField(
              style: TextStyle(fontSize: 16),
              autofocus: true,
              controller: titleController,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 35, horizontal: 20),
                label: Text('Title'),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30)
                ),
                
              ),
            ),
          ),
          SizedBox(height: 5,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(child: Text('Cancel',), onPressed: ()=> Navigator.pop(context),),
              TextButton(
                onPressed: (){
                var task = Task(title: titleController.text);
                context.read<TaskBloc>().add(AddTask(task: task));
                Navigator.pop(context);

              }, child: Text('Add')),
            ],
          ),
        ],
      ),
    );
  }
}