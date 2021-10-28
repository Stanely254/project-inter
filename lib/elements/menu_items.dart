import 'package:flutter/material.dart';
import 'package:project/controllers/app_state_controller.dart';
import 'package:project/elements/custom_text.dart';
import 'package:provider/provider.dart';

class MenuItems extends StatelessWidget {
  const MenuItems({
    Key? key,
    required this.value,
    required this.title,
    required this.onTap,
  }) : super(key: key);
  final int value;
  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Consumer<AppStateController>(
      builder: (context, appState, child) => TextButton(
        child: CustomText(text: title),
        onPressed: () {
          appState.setCurrentMenuItem(value);
          onTap();
        },
      ),
    );
  }
}
