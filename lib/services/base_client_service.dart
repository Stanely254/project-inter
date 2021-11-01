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
        try {
          var jsonString = """
          ${value.body}
          """;
          var list = json.decode(jsonString) as List;
          todos = list.map<Todos>((json) => Todos.fromJson(json)).toList();
          // todos = List<Todos>.from(
          //     json.decode(value.body).map((x) => Todos.fromJson(x))).toList();
        } catch (e, trace) {
          printLog("ERR==========================${e.toString()}");
          printLog("HAPPENDED=========================${trace.toString()}");
        }
      }
      printLog("RESPONSE======================${todos[0].id}");
    });
    return todos;
  }
}
