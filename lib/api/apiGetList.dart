import 'dart:convert';

import 'package:flutter_bloc_example/api/apiDoingly.dart';
import 'package:http/http.dart' as http;
import '../blocExample/model/taskListModel.dart';
import '../storageTest/storageTest.dart';

class GetTaskList {
  Future<List<TaskListModel>> taskListFuture = getTaskList();

  static Future<List<TaskListModel>> getTaskList() async {
    final responseTaskList = await http
        .get(Uri.parse('http://119.235.112.154:3003/api/v1/lists'), headers: {
      'accept': 'application/json',
      'Authorization':
          'Bearer ${userData['token']}'
    });
    final body = json.decode(responseTaskList.body);
    return body.map<TaskListModel>(TaskListModel.fromJson).toList();
  }
}
