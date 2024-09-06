import 'package:flutter/material.dart';

/// THe ThemeModification class is used to Track the theme for changing according to the boolean value
///
/// The class extends ChangeNotifier which is used to notify the listeners
class ThemeModification with ChangeNotifier {
  /// This is the boolean value which is used to check if the dark mode is enabled or not
  bool isDarkMode = false;

  /// This method is used to update the theme of the app
  void updateMode({required bool darkMode}) {
    isDarkMode = darkMode;
    notifyListeners();
    // This method is used to notify the listeners that the value has been changed
  }
}
