import 'package:flutter/material.dart';
import 'package:project/elements/custom_text.dart';
import 'package:project/elements/todo_card.dart';
import 'package:project/helpers/logs.dart';
import 'package:project/models/todos.dart';
import 'package:project/services/base_client_service.dart';

class ResponseView extends StatefulWidget {
  const ResponseView({Key? key}) : super(key: key);

  @override
  _ResponseViewState createState() => _ResponseViewState();
}

class _ResponseViewState extends State<ResponseView> {
  BaseClientService baseClient = BaseClientService();
  List<Todos> todosList = [];

  void getAllTodos() async {
    baseClient.getAllTodos().then((value) => {
          if (mounted)
            {
              setState(() {
                todosList = value;
              })
            }
        });

    printLog(todosList.toString());
  }

  @override
  void initState() {
    super.initState();
    getAllTodos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: Icon(Icons.arrow_back_ios, color: Colors.white)),
          title: CustomText(
            text: 'Response',
            color: Colors.white,
            fontSize: SIZE(context: context).width * .065,
          ),
          centerTitle: true,
        ),
        body: SizedBox(
            height: SIZE(context: context).height,
            width: SIZE(context: context).width,
            child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SingleChildScrollView(
                  child: Column(
                    children: todosList.map((e) => TodoCard(todo: e)).toList(),
                  ),
                ))));
  }
}
