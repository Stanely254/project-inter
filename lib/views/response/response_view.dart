import 'package:flutter/material.dart';
import 'package:project/elements/custom_text.dart';
import 'package:project/elements/todo_card.dart';
import 'package:project/helpers/logs.dart';
import 'package:project/models/todos.dart';
import 'package:project/services/base_client_service.dart';

class ResponseView extends StatefulWidget {
  const ResponseView({Key? key}) : super(key: key);
  static const String routeName = 'response';

  @override
  _ResponseViewState createState() => _ResponseViewState();
}

class _ResponseViewState extends State<ResponseView> {
  BaseClientService baseClient = BaseClientService();
  List<Todos> todosList = [];

  void getAllTodos() async {
    baseClient.getAllTodos().then((value) => {
          if (mounted) {setState(() => todosList = value)}
        });
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
          title: CustomText(text: state(context: context).currentTitle),
        ),
        body: SizedBox(
          height: SIZE(context: context).height,
          width: SIZE(context: context).width,
          child: ListView.separated(
              shrinkWrap: true,
              physics: BouncingScrollPhysics(),
              itemBuilder: (context, index) => TodoCard(
                    todo: todosList[index],
                  ),
              separatorBuilder: (context, index) => Divider(
                    color: Colors.black,
                  ),
              itemCount: todosList.length),
        ));
  }
}
