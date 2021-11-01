import 'package:flutter/material.dart';
import 'package:project/controllers/app_state_controller.dart';
import 'package:project/elements/custom_text.dart';
import 'package:project/helpers/logs.dart';
import 'package:provider/provider.dart';

class MenuItems extends StatelessWidget {
  const MenuItems({
    Key? key,
    required this.value,
    this.onTap,
    required this.title,
  }) : super(key: key);
  final int value;
  final String title;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Consumer<AppStateController>(
      builder: (context, appState, child) => TextButton(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Align(
            alignment: Alignment.topLeft,
            child: Container(
                height: SIZE(context: context).height * .048,
                width: SIZE(context: context).width,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: value == appState.currentMenuItem
                        ? Theme.of(context).primaryColor
                        : Colors.grey[300],
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomText(
                    text: title,
                    fontSize: SIZE(context: context).width * .054,
                    color: value != appState.currentMenuItem
                        ? Theme.of(context).primaryColor
                        : Colors.white,
                    fontWeight: value != appState.currentMenuItem
                        ? FontWeight.bold
                        : FontWeight.w600,
                    alignment: TextAlign.center,
                  ),
                )),
          ),
        ),
        onPressed: () {
          Navigator.pop(context);
          onTap!();
          // goto(context: context, routeName: routeName);
        },
      ),
    );
  }
}
