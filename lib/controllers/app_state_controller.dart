import 'dart:math';

import 'package:flutter/material.dart';
import 'package:project/models/user.dart';

class AppStateController extends ChangeNotifier {
  int? currentMenuItem;

  String currentTitle = 'Home';

  var users = <User>[];

  addUser(User user) {
    users.add(user);
    notifyListeners();
  }

  void setCurrentTitle(String title) {
    currentTitle = title;
    notifyListeners();
  }

  bool isEmailValid(String email) {
    return RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
  }

  String generateRandomString(int len) {
    var r = Random();
    String randomString =
        String.fromCharCodes(List.generate(len, (index) => r.nextInt(33) + 89));
    return randomString;
  }
}
