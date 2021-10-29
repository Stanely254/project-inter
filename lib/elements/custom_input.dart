import 'package:flutter/material.dart';

class CustomInput extends StatelessWidget {
  const CustomInput(
      {Key? key,
      required this.controller,
      this.type = TextInputType.text,
      this.label,
      this.hintText,
      this.labelColor,
      required this.onChanged,
      this.autovalidateMode = AutovalidateMode.disabled,
      this.validator})
      : super(key: key);
  final TextEditingController controller;
  final TextInputType type;
  final String? label;
  final String? hintText;
  final Color? labelColor;
  final Function(String) onChanged;
  final AutovalidateMode autovalidateMode;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: controller,
        autovalidateMode: autovalidateMode,
        validator: validator,
        cursorColor: Theme.of(context).primaryColor,
        onChanged: onChanged,
        decoration: InputDecoration(
            border: OutlineInputBorder(
                borderSide: BorderSide(
                    color: Theme.of(context).primaryColor, width: 3.5)),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Theme.of(context).primaryColor),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Theme.of(context).primaryColor),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Theme.of(context).primaryColor),
            ),
            hintText: hintText,
            hintStyle: TextStyle(color: Colors.grey),
            labelText: label,
            labelStyle: TextStyle(color: Theme.of(context).primaryColor)),
      ),
    );
  }
}
