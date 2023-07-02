import 'package:http/http.dart' as http;

import '../storageTest/storageTest.dart';

class DeleteTaskList {

  static Future<dynamic> deleteTaskList(String uuid) async {
    String prefixUrl = 'http://119.235.112.154:3003/api/v1/lists/';
    final responseDelete = await http.delete(Uri.parse(prefixUrl + uuid), headers: {
      'accept': 'application/json',
      'Authorization': 'Bearer ${userData['token']}'
    });
    final body = responseDelete.body;
    print(body);
    return body;
  }
}
