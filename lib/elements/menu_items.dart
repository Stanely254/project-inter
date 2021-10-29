import 'package:flutter/material.dart';
import 'package:project/controllers/app_state_controller.dart';
import 'package:project/elements/custom_text.dart';
import 'package:project/helpers/logs.dart';
import 'package:provider/provider.dart';

class MenuItems extends StatelessWidget {
  const MenuItems(
      {Key? key,
      required this.value,
      required this.title,
      required this.routeName})
      : super(key: key);
  final int value;
  final String title;
  final String routeName;

  @override
  Widget build(BuildContext context) {
    return Consumer<AppStateController>(
      builder: (context, appState, child) => TextButton(
        child: CustomText(text: title),
        onPressed: () {
          appState.setCurrentTitle(title);
          appState.setCurrentMenuItem(value);
          Navigator.pop(context);
          goto(context: context, routeName: routeName);
        },
      ),
    );
  }
}
