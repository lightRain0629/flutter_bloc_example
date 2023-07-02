import 'dart:convert';

import '../blocExample/model/tasksOnlineModel.dart';
import 'package:http/http.dart' as http;

import '../storageTest/storageTest.dart';

class GetTasksFromList {
  Future<List<TasksOnline>> getTaskFromList(String listUuid) async {
    String firstPartUrl = 'http://119.235.112.154:3003/api/v1/lists/';
    String lastPartUrl = '/tasks';
    final response = await http
        .get(Uri.parse(firstPartUrl + listUuid + lastPartUrl), headers: {
      'accept': 'application/json',
      'Authorization': 'Bearer ${userData['token']}',
    });
    final body = json.decode(response.body);
    return body.map<TasksOnline>(TasksOnline.fromJson).toList();
  }
}
