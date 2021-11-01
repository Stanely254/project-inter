// To parse this JSON data, do
//
//     final dictionaryModel = dictionaryModelFromJson(jsonString);

import 'dart:convert';

DictionaryModel dictionaryModelFromJson(String str) =>
    DictionaryModel.fromJson(json.decode(str));

String dictionaryModelToJson(DictionaryModel data) =>
    json.encode(data.toJson());

class DictionaryModel {
  DictionaryModel({
    this.id,
    this.value,
  });

  String? id;
  String? value;

  factory DictionaryModel.fromJson(Map<String, dynamic> json) =>
      DictionaryModel(
        id: json["id"],
        value: json["value"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "value": value,
      };
}
