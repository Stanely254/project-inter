import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:project/helpers/logs.dart';
import 'package:project/models/todos.dart';

class BaseClientService {
  final String url;
  const BaseClientService({this.url = 'https://jsonplaceholder.typicode.com'});

  Future<List<Todos>> getAllTodos() async {
    List<Todos> todos = [];
    String responseString = '';
    httpGet(Uri.parse("$url/todos?limit=5"),
            headers: {'Accept': 'application/json'},
            responseType: ResponseType.json)
        .then((response) {
      if (response.statusCode == 200) {
        responseString = response.body;

        todos = todosFromJson(responseString);
      }
      printLog("RESPONSE======================$responseString");
    });
    return todos;
  }
}
