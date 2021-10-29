import 'package:flutter/material.dart';
import 'package:project/controllers/app_state_controller.dart';
import 'package:project/views/design/design_view.dart';
import 'package:provider/provider.dart';
import 'package:page_transition/page_transition.dart';

import 'views/dictionary/dictionary_view.dart';
import 'views/home/home_view.dart';
import 'views/info/info_view.dart';
import 'views/response/response_view.dart';

void main() {
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
      initialRoute: HomeView.routeName,
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case DesignView.routeName:
            return PageTransition(
                child: DesignView(), type: PageTransitionType.scale);
          case DictionaryView.routeName:
            return PageTransition(
                child: DictionaryView(), type: PageTransitionType.scale);
          case InfoView.routeName:
            return PageTransition(
                child: InfoView(), type: PageTransitionType.scale);
          case ResponseView.routeName:
            return PageTransition(
                child: ResponseView(), type: PageTransitionType.scale);

          default:
            return PageTransition(
                child: HomeView(), type: PageTransitionType.scale);
        }
      },
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
    );
  }
}
