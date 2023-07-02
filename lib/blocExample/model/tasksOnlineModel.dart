class TasksOnline {
  final String uuid;
  final String text;
  final bool completed;
  final String createdAt;
  final String updatedAt;

  TasksOnline({
    required this.uuid,
    required this.text,
    required this.completed,
    required this.createdAt,
    required this.updatedAt,
  });

  static TasksOnline fromJson(json) => TasksOnline(
      uuid: json['uuid'],
      text: json['text'],
      completed: json['completed'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt']);
}
