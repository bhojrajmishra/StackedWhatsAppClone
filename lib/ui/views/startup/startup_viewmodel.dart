import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:stacked/stacked.dart';
import 'package:whats_app_clone/app/app.locator.dart';
import 'package:whats_app_clone/app/app.router.dart';
import 'package:stacked_services/stacked_services.dart';

class StartupViewModel extends BaseViewModel {
  var user = FirebaseAuth.instance.currentUser;

  final _navigationService = locator<NavigationService>();

  Future runStartupLogic() async {
    await Future.delayed(const Duration(seconds: 3));

    if (user == null) {
      _navigationService.pushNamedAndRemoveUntil(Routes.loginView);
    } else {
      _navigationService.pushNamedAndRemoveUntil(Routes.homeView);
    }
  }
}
