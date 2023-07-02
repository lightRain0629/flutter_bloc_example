// ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'dart:convert';

class TaskListModel {
  final String uuid;
  final String name;
  final  completedTaskCount;
  final  taskCount;

  const TaskListModel({
    required this.uuid,
    required this.name,
    required this.completedTaskCount,
    required this.taskCount,
  });

  static TaskListModel fromJson(json) => TaskListModel(
      uuid: json['uuid'],
      name: json['name'],
      completedTaskCount: json['completedTaskCount'],
      taskCount: json['taskCount']);


}
