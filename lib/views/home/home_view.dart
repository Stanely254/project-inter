import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:project/controllers/app_state_controller.dart';
import 'package:project/elements/custom_menu_drawer.dart';
import 'package:project/elements/custom_text.dart';
import 'package:project/helpers/logs.dart';
import 'package:provider/provider.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Consumer<AppStateController>(
      builder: (context, appState, child) => Scaffold(
          key: _scaffoldKey,
          appBar: AppBar(
            title: CustomText(
              text: 'Home',
              color: Colors.white,
              fontSize: SIZE(context: context).width * .065,
            ),
            centerTitle: true,
            leading: IconButton(
                onPressed: () {
                  _scaffoldKey.currentState!.openDrawer();
                },
                icon: Icon(Icons.menu, color: Colors.white)),
          ),
          drawer: CustomMenuDrawer(),
          body: SizedBox(
            height: SIZE(context: context).height,
            width: SIZE(context: context).width,
            child: Center(
              child: Lottie.asset(
                'assets/lottie/welcome.json',
              ),
            ),
          )),
    );
  }
}
