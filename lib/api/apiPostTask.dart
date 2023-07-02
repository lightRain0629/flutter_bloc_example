import 'dart:convert';

import 'package:flutter_bloc_example/blocExample/model/tasksOnlineModel.dart';
import 'package:http/http.dart' as http;

import '../storageTest/storageTest.dart';

class PostTask {
  Future<dynamic> postTask(String name, bool completed, String listUuid) async {
    final bodyToSent = {
      "text": name,
      "completed": completed,
      "listUuid": listUuid,
    };

    final response =
        await http.post(Uri.parse('http://119.235.112.154:3003/api/v1/tasks'),
            headers: {
              'accept': 'application/json',
              'Authorization': 'Bearer ${userData['token']}',
              'Content-type': 'application/json'
            },
            body: jsonEncode(bodyToSent));
    final body = response.body;
    return body;
  }
}
