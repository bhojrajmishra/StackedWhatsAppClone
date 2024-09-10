import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
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
  final SnackbarService snackbarService = locator<SnackbarService>();
  final NavigationService _navigationService = locator<NavigationService>();

  Future<void> logout() async {
    await FirebaseAuth.instance.signOut();
    debugPrint('User logged out');
    snackbarService.showSnackbar(message: 'User logged out');
    // await _storageService.delete(key: 'token');
    _navigationService.pushNamedAndRemoveUntil(Routes.loginView);
  }
}
