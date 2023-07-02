import 'dart:convert';

import 'package:http/http.dart' as http;

import '../storageTest/storageTest.dart';

class DeleteTaskOnline {
  Future<dynamic> deleteTask(String endpointUuid) async {
    String firstPartUrl = 'http://119.235.112.154:3003/api/v1/tasks/';
    final response = await http.delete(Uri.parse(firstPartUrl + endpointUuid),
        headers: {
          'accept': 'application/json',
          'Authorization': 'Bearer ${userData['token']}'
        });
        final body = json.decode(response.body);
        return body;
  }
}
