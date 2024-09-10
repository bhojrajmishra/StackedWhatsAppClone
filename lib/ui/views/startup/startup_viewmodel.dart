import 'package:flutter/foundation.dart';
import 'package:stacked/stacked.dart';
import 'package:whats_app_clone/app/app.locator.dart';
import 'package:whats_app_clone/app/app.router.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:whats_app_clone/local_storage/storage_service.dart';

class StartupViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _storage = locator<StorageService>();

  Future runStartupLogic() async {
    await Future.delayed(const Duration(seconds: 1));
    final token = await _storage.read(key: 'token');

    if (token != null) {
      debugPrint('Token exists: $token');
      await _navigationService.pushNamedAndRemoveUntil(Routes.homeView);
    } else {
      debugPrint('No token found. Navigating to login.');
      await _navigationService.navigateToLoginView();
    }
  }
}
