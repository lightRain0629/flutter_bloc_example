import 'dart:convert';

import 'package:flutter_bloc_example/api/apiDoingly.dart';
import 'package:http/http.dart' as http;
import '../blocExample/model/taskListModel.dart';
import '../storageTest/storageTest.dart';

class PostTaskList {
  // Future<dynamic> taskListFuturePostTask = postTaskList();

  static Future<dynamic> postTaskList(String name) async {
    Map bodyToSent = {
      'name': name,
    };
    final responseTaskListPost = await http.post(
        Uri.parse('http://119.235.112.154:3003/api/v1/lists'),
        body: jsonEncode(bodyToSent),
        headers: {
          'accept': 'application/json',
          'Authorization': 'Bearer ${userData['token']}',
          'Content-type': 'application/json'
        });
    final body = json.decode(responseTaskListPost.body);
    return body;
  }
}
