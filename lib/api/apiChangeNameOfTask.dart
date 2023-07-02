import 'dart:convert';

import 'package:http/http.dart' as http;

import '../storageTest/storageTest.dart';

class ChangeTaskName {
  Future<dynamic> changeTaskName(String endpointUuid, String newName, bool completed, String listUuid) async {
    String firstPartUrl = 'http://119.235.112.154:3003/api/v1/tasks/';
    Map dataToSend = {
      "text" :  newName,
      "completed" : completed,
      "listUuid" : listUuid,
    };
    final response =
        await http.put(Uri.parse(firstPartUrl + endpointUuid), headers: {
      'accept': 'application/json',
      'Authorization': 'Bearer ${userData['token']}',
      'Content-type': 'application/json'
    }, body: jsonEncode(dataToSend));
    final body = response.body;
    return body;
  }
}
