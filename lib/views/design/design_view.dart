import 'package:flutter/material.dart';
import 'package:project/elements/custom_text.dart';
import 'package:project/helpers/logs.dart';

class DesignView extends StatefulWidget {
  const DesignView({Key? key}) : super(key: key);
  static const String routeName = 'design';

  @override
  _DesignViewState createState() => _DesignViewState();
}

class _DesignViewState extends State<DesignView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        title: CustomText(text: state(context: context).currentTitle),
      ),
    );
  }
}
