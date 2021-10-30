import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:project/helpers/logs.dart';
import 'package:project/models/todos.dart';

class BaseClientService {
  final String url;
  const BaseClientService({this.url = 'https://jsonplaceholder.typicode.com/'});

  Future<List<Todos>> getAllTodos() async {
    List<Todos> todos = [];
    httpGet(Uri.parse(url),
            headers: {'Accept': 'application/json'},
            responseType: ResponseType.json)
        .then((value) {
      if (value.body == '201' && value.statusCode == 200) {
        var list = json.decode(value.body) as List;
        todos = list.map<Todos>((json) => Todos.fromJson(json)).toList();
      }
    });
    return todos;
  }
}
