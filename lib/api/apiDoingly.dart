import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc_example/UI/tasks_screen.dart';
import 'package:flutter_bloc_example/api/apiGetList.dart';
import 'package:flutter_bloc_example/blocExample/model/userModel.dart';
import 'package:flutter_bloc_example/storageTest/storageTest.dart';
import 'package:http/http.dart' as http;

import '../UI/taskListOnline.dart';
import '../blocExample/model/registerProblem.dart';
import '../blocExample/model/tokenModel.dart';

class ApiDoingly {
  String url = 'http://119.235.112.154:3003';

  Future<dynamic> onPostLogin(
      String endpoint, Map data, BuildContext context) async {
    String finalUrl = url + endpoint;
    try {
      var response = await http.post(Uri.parse(finalUrl),
          body: jsonEncode(data),
          headers: {
            'accept': 'application/json',
            'Content-type': 'application/json'
          });
      if (response.statusCode == 200) {
        var body = jsonDecode(response.body);
        userData['token'] = body['token'];
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => TasksScreenOnline()));
        return body['token'];
      } else if (response.statusCode == 400) {
        var body = jsonDecode(response.body);
        return body;
      }
      var body = jsonDecode(response.body);
      return body;
    } catch (e) {
      return Exception(e.toString());
    }
  }

  Future<dynamic> onPostReg(Map data, BuildContext context) async {
    String finalUrl = url + '/api/v1/users/register';
    try {
      var response = await http.post(Uri.parse(finalUrl),
          body: jsonEncode(data),
          headers: {
            'accept': 'application/json',
            'Content-type': 'application/json'
          });
      if (response.statusCode == 200) {
        var body = jsonDecode(response.body);
        userData['token'] = body['token'];
        print(body['token']);
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => TasksScreenOnline()));
        return body;
      } else if (response.statusCode == 400) {
        var body = jsonDecode(response.body);
        return body;
      }
    } catch (e) {
      return (e.toString());
    }
  }
}
