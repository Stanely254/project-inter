import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  const CustomText(
      {Key? key,
      required this.text,
      this.fontSize,
      this.fontWeight,
      this.color,
      this.alignment = TextAlign.justify})
      : super(key: key);
  final String text;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? color;
  final TextAlign alignment;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color ?? Colors.black,
        fontWeight: fontWeight ?? FontWeight.normal,
        fontSize: fontSize ?? 16,
      ),
    );
  }
}
