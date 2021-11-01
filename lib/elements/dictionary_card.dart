import 'package:flutter/material.dart';
import 'package:project/elements/custom_text.dart';

class DictionaryCard extends StatelessWidget {
  const DictionaryCard({
    Key? key,
    required this.keyValue,
    required this.value,
  }) : super(key: key);
  final String keyValue;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        elevation: 10,
        shadowColor: Colors.black,
        color: Colors.grey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomText(text: '$keyValue', color: Colors.white),
              CustomText(text: '$value', color: Colors.white),
            ],
          ),
        ),
      ),
    );
  }
}
