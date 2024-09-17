import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:stacked/stacked.dart';
import 'package:whats_app_clone/app/app.locator.dart';
import 'package:whats_app_clone/app/app.router.dart';
import 'package:stacked_services/stacked_services.dart';

class StartupViewModel extends BaseViewModel {
  final _auth = FirebaseAuth.instance;
  final _navigationService = locator<NavigationService>();

  Future runStartupLogic() async {
    try {
      await Future.delayed(const Duration(seconds: 3));

      _auth.authStateChanges().listen((User? user) {
        if (user == null) {
          _navigationService.pushNamedAndRemoveUntil(Routes.loginView);
        } else {
          _navigationService.pushNamedAndRemoveUntil(Routes.homeView);
        }
      });
    } catch (e) {
      debugPrint('Error in startup logic: $e');
    }
  }
}
