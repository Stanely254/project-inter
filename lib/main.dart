import 'package:flutter/material.dart';
import 'package:project/controllers/app_state_controller.dart';
import 'package:provider/provider.dart';

import 'views/home/home_view.dart';

Future<void> main() async {
  runApp(MultiProvider(
      providers: [ChangeNotifierProvider.value(value: AppStateController())],
      child: MyApp()));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Project',
      home: HomeView(),
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
    );
  }
}
