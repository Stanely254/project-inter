import 'package:flutter/material.dart';
import 'package:project/elements/custom_text.dart';
import 'package:project/helpers/logs.dart';

class DictionaryView extends StatefulWidget {
  const DictionaryView({Key? key}) : super(key: key);
  static const String routeName = 'dictionary';

  @override
  _DictionaryViewState createState() => _DictionaryViewState();
}

class _DictionaryViewState extends State<DictionaryView> {
  Map<String, dynamic> dictionary = {};

  void createDictionary() {
    setState(() {
      dictionary = {
        '34': 'thirty-four',
        '90': 'ninety',
        '91': 'ninety-one',
        '21': 'twenty-one',
        '61': 'sixty-one',
        '9': 'nine',
        '2': 'two',
        '6': 'six',
        '3': 'three',
        '8': 'eight',
        '80': 'eighty',
        '81': 'eighty-one',
        'Ninety-Nine': '99',
        'nine-hundred': '900'
      };
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(text: state(context: context).currentTitle),
        centerTitle: true,
        actions: [],
      ),
      body: SizedBox(
        height: SIZE(context: context).height,
        width: SIZE(context: context).width,
        child: ListView(
          shrinkWrap: true,
          children: [],
        ),
      ),
    );
  }
}
