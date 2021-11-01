import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:project/elements/custom_text.dart';
import 'package:project/elements/dictionary_card.dart';
import 'package:project/helpers/logs.dart';
import 'package:project/models/dictionary_model.dart';

class DictionaryView extends StatefulWidget {
  const DictionaryView({Key? key}) : super(key: key);

  @override
  _DictionaryViewState createState() => _DictionaryViewState();
}

class _DictionaryViewState extends State<DictionaryView> {
  Map<String, dynamic> dictionary = {};

  List<DictionaryModel> dictionaryList = [];

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

      dictionary.forEach((key, value) =>
          dictionaryList.add(DictionaryModel(id: key, value: value)));
    });

    printLog("DICTIONARY=======================${json.encode(dictionaryList)}");
  }

  void sort(List<DictionaryModel> list) {
    for (var diction in list) {
      if (diction.id!.contains(new RegExp(r'[0-9]'))) {
        setState(() {
          var newList = list
              .where((element) => element.id!.contains(new RegExp(r'[0-9]')))
              .toList();

          newList.sort((a, b) => int.parse(a.id!).compareTo(int.parse(b.id!)));
        });
      } else {
        setState(() {
          var newList = list
              .where((element) => !element.id!.contains(new RegExp(r'[0-9]')))
              .toList();
          newList.sort((a, b) => a.id!.compareTo(b.id!));
        });
      }
    }
  }

  @override
  void initState() {
    super.initState();
    createDictionary();
    sort(dictionaryList);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(Icons.arrow_back_ios, color: Colors.white)),
        title: CustomText(
          text: 'Dictionary',
          color: Colors.white,
          fontSize: SIZE(context: context).width * .065,
        ),
        centerTitle: true,
      ),
      body: SizedBox(
        height: SIZE(context: context).height,
        width: SIZE(context: context).width,
        child: ListView(
          shrinkWrap: true,
          children: dictionaryList
              .map((e) => DictionaryCard(keyValue: e.id!, value: e.value!))
              .toList(),
        ),
      ),
    );
  }
}
