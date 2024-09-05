import 'package:stacked/stacked.dart';

class SettingViewModel extends BaseViewModel {
  bool isDarkMode = false;

  void updateMode({required bool darkMode}) {
    isDarkMode = darkMode;
    notifyListeners();
  }
}
