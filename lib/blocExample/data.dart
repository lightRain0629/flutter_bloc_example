import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'top.dart';

class GetInfo {
  int count = 0;
  List at = [];
  Future<JsonLessom> getinfo(bool refresh, BuildContext context) async {
    if (refresh) {
      count = 0;
    }
    late JsonLessom jsonfile;
    final response = await http
        .get(Uri.parse('http://216.250.9.29:5003/public/products/top'));
    debugPrint(response.body);
    debugPrint(response.statusCode.toString());
    var deco = jsonDecode(response.body);
    jsonfile = JsonLessom.fromJson(deco) as JsonLessom;
    if (refresh) {
      at = jsonfile.rows;
    } else {
      
      at.add(jsonfile.rows);
    }
    return jsonfile;
  }
}
