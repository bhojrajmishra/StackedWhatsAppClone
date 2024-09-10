import 'package:flutter/foundation.dart';
import 'package:stacked/stacked.dart';
import 'package:dio/dio.dart';
import 'package:whats_app_clone/local_storage/storage_service.dart';
import 'package:whats_app_clone/network/dio_client.dart';
import 'package:whats_app_clone/app/app.locator.dart';
import 'package:whats_app_clone/app/app.router.dart';
import 'package:stacked_services/stacked_services.dart';

class SettingViewModel extends BaseViewModel {
  final StorageService _storageService = locator<StorageService>();
  final NavigationService _navigationService = locator<NavigationService>();

  Future<void> logout() async {
    try {
      Response response = await DioClient.sharedDio.post(
        'https://tbe.thuprai.com/v1/user/logout/',
      );
      debugPrint("send token to thuprai: ${response.statusCode}");

      if (response.statusCode == 200) {
        await _storageService.delete(key: 'token');
        debugPrint('Logout successful and token send');

        _navigationService.pushNamedAndRemoveUntil(Routes.loginView);
      } else {
        debugPrint('Failed to log out: ${response.statusCode}');
      }
    } catch (e) {
      debugPrint('Logout failed: $e');
    }
  }
}
