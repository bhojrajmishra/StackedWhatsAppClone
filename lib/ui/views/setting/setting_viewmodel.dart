import 'package:flutter/material.dart';

class SettingViewModel with ChangeNotifier {
  bool isDarkMode = false;

  /// This method is used to update the theme of the app
  void updateMode({required bool darkMode}) {
    isDarkMode = darkMode;
    notifyListeners();
    // This method is used to notify the listeners that the value has been changed
  }
}
