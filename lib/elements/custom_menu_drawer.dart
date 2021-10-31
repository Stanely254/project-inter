import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:project/elements/menu_items.dart';
import 'package:project/helpers/logs.dart';
import 'package:project/views/design/design_view.dart';
import 'package:project/views/dictionary/dictionary_view.dart';
import 'package:project/views/info/info_view.dart';
import 'package:project/views/response/response_view.dart';

class CustomMenuDrawer extends StatelessWidget {
  const CustomMenuDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          DrawerHeader(
              child: Container(
            height: SIZE(context: context).height * .2,
            width: SIZE(context: context).width,
            child: Center(
              child: Icon(Icons.person,
                  color: Colors.white, size: SIZE(context: context).width * .2),
            ),
            decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(10)),
          )),
          MenuItems(
            value: 1,
            title: 'Info',
            onTap: () {
              state(context: context).setCurrentTitle('Info');
              Navigator.push(
                  context,
                  PageTransition(
                      child: InfoView(), type: PageTransitionType.fade));
            },
          ),
          MenuItems(
            value: 2,
            title: 'Design',
            onTap: () {
              state(context: context).setCurrentTitle('Info');
              Navigator.push(
                  context,
                  PageTransition(
                      child: DesignView(), type: PageTransitionType.fade));
            },
          ),
          MenuItems(
            value: 3,
            title: 'Response',
            onTap: () {
              state(context: context).setCurrentTitle('Info');
              Navigator.push(
                  context,
                  PageTransition(
                      child: ResponseView(), type: PageTransitionType.fade));
            },
          ),
          MenuItems(
            value: 4,
            title: 'Dictoionary',
            onTap: () {
              state(context: context).setCurrentTitle('Info');
              Navigator.push(
                  context,
                  PageTransition(
                      child: DictionaryView(), type: PageTransitionType.fade));
            },
          ),
        ],
      ),
    );
  }
}
