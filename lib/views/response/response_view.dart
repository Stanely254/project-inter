import 'package:flutter/material.dart';
import 'package:project/elements/custom_text.dart';
import 'package:project/helpers/logs.dart';

class ResponseView extends StatefulWidget {
  const ResponseView({Key? key}) : super(key: key);
  static const String routeName = 'response';

  @override
  _ResponseViewState createState() => _ResponseViewState();
}

class _ResponseViewState extends State<ResponseView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(text: state(context: context).currentTitle),
      ),
    );
  }
}
