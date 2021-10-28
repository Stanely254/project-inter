import 'package:flutter/material.dart';

class AppStateController extends ChangeNotifier {
  int? currentMenuItem;

  String? currentTitle;

  void setCurrentMenuItem(int index) {
    currentMenuItem = index;
    notifyListeners();
  }

  void setCurrentTitle(String title){
    currentTitle = title;
    notifyListeners();
  }
}
