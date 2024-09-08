import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:whats_app_clone/app/app.locator.dart';
import 'package:whats_app_clone/app/app.router.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:whats_app_clone/local_storage/storage_service.dart';

class StartupViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final StorageService _storage = StorageService();
  // Place anything here that needs to happen before we get into the application
  Future runStartupLogic() async {
    // You can check for the user token here and decide where to navigate
    await Future.delayed(const Duration(seconds: 1));
    final gettoken = await _storage.read(key: 'token');
    if (gettoken != null) {
      _navigationService.pushNamedAndRemoveUntil(Routes.homeView);
      debugPrint('accesstoken: $gettoken');
    } else {
      _navigationService.navigateToLoginView();
    }
  }
}
