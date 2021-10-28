import 'package:flutter/material.dart';
import 'package:project/controllers/app_state_controller.dart';
import 'package:project/elements/custom_menu_drawer.dart';
import 'package:project/helpers/logs.dart';
import 'package:provider/provider.dart';

class HomeView extends StatefulWidget {
  HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Consumer<AppStateController>(
      builder: (context, appState, child) => Scaffold(
        appBar: AppBar(),
        drawer: CustomMenuDrawer(),
        body: SizedBox(
          height: SIZE(context: context).height,
          width: SIZE(context: context).width,
          child: ListView(
            shrinkWrap: true,
            children: [],
          )
        )
      ),
    );
  }
}
