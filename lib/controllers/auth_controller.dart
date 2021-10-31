import 'package:project/helpers/logs.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<void> saveData(
      {required String key, bool isDataBoolean = false, dynamic value}) async {
    final SharedPreferences prefs = await _prefs;
    if (isDataBoolean) {
      prefs.setBool(key, value);
      printLog('Bool value saved successfully', DateTime.now());
    } else {
      prefs.setString(key, value);
      printLog('String value saved successfully', DateTime.now());
    }
  }

  Future<dynamic> getData(
      {required String key, bool isDataBoolean = false}) async {
    final SharedPreferences prefs = await _prefs;
    dynamic value;
    if (isDataBoolean) {
      value = prefs.getBool(key);
      printLog('Bool value retrieved successfully', DateTime.now());
    } else {
      value = prefs.getString(key);
      printLog('String value retrieved successfully', DateTime.now());
    }
    return value;
  }
}
