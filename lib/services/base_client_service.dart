import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:project/helpers/logs.dart';
import 'package:project/models/todos.dart';

class BaseClientService {
  final String url;
  const BaseClientService({this.url = 'https://jsonplaceholder.typicode.com'});

  Future<List<Todos>> getAllTodos() async {
    List<Todos> todos = [];

    httpGet(Uri.parse("$url/todos?limit=5"),
            headers: {
              'Content-Type': 'application/json;charset=UTF-8',
              'Charset': 'utf-8'
            },
            responseType: ResponseType.json)
        .then((value) {
      if (value.statusCode == 200) {
        //final data = jsonDecode(value.body);

        final data = jsonDecode(value.body);
        // // for (Map<String, dynamic> i in data) {
        // todos = data.map<Todos>((json) => Todos.fromJson(json)).toList();
        for (Map<String, dynamic> i in data) {
          todos.add(Todos.fromJson(i));
        }
      }
      printLog("RESPONSE======================${value.body}");
    });
    return todos;
  }
}
