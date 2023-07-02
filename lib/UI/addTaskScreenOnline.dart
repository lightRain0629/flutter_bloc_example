import 'package:flutter/material.dart';
import '../api/apiPostList.dart';

class AddTaskScreenOnline extends StatefulWidget {


  @override
  State<AddTaskScreenOnline> createState() => _AddTaskScreenOnlineState();
}

class _AddTaskScreenOnlineState extends State<AddTaskScreenOnline> {
        TextEditingController titleController = TextEditingController();


        // @override
  // void dispose() {
  //   // TODO: implement dispose
  //   titleController.dispose();
  // }

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
                  PostTaskList.postTaskList(titleController.text);
                  setState(() {});
                  Navigator.pop(context);
              }, child: Text('Add')),
            ],
          ),
        ],
      ),
    );
  }
}