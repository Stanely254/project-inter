import 'package:flutter/material.dart';
import 'package:project/elements/menu_items.dart';
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
          MenuItems(
            value: 1,
            title: 'Info',
            routeName: InfoView.routeName,
          ),
          MenuItems(
            value: 2,
            title: 'Design',
            routeName: DesignView.routeName,
          ),
          MenuItems(
            value: 3,
            title: 'Response',
            routeName: ResponseView.routeName,
          ),
          MenuItems(
            value: 4,
            title: 'Dictoionary',
            routeName: DictionaryView.routeName,
          ),
        ],
      ),
    );
  }
}
