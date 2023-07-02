import 'dart:convert';

import 'package:http/http.dart' as http;

import '../storageTest/storageTest.dart';

class RenameTaskList {
  
  Future<dynamic> renameTaskList(String uuidList, String newName) async {
    String url = 'http://119.235.112.154:3003/api/v1/lists/';
    Map bodyToSent = {'name': newName};

    final response = await http.put(Uri.parse(url + uuidList),
        headers: {
          'accept': 'application/json',
          'Authorization': 'Bearer ${userData['token']}',
          'Content-type': 'application/json'
        },
        body: jsonEncode(bodyToSent));
    final body = json.decode(response.body);
    print(body);
    return body;
  }
}
