import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:whats_app_clone/app/app.locator.dart';

enum SnackbarType { success, error, info }

class SnackbarHelper {
  final SnackbarService _snackbarService = locator<SnackbarService>();

  void setupCustomSnackbars() {
    _snackbarService.registerCustomSnackbarConfig(
      variant: SnackbarType.success,
      config: SnackbarConfig(
        backgroundColor: Colors.green,
        textColor: Colors.white,
        borderRadius: 8,
        dismissDirection: DismissDirection.horizontal,
        animationDuration: Duration(milliseconds: 500),
      ),
    );

    _snackbarService.registerCustomSnackbarConfig(
      variant: SnackbarType.error,
      config: SnackbarConfig(
        backgroundColor: Colors.red,
        textColor: Colors.white,
        borderRadius: 8,
        dismissDirection: DismissDirection.horizontal,
        animationDuration: Duration(milliseconds: 500),
      ),
    );

    _snackbarService.registerCustomSnackbarConfig(
      variant: SnackbarType.info,
      config: SnackbarConfig(
        backgroundColor: Colors.blue,
        textColor: Colors.white,
        borderRadius: 8,
        dismissDirection: DismissDirection.horizontal,
        animationDuration: Duration(milliseconds: 500),
      ),
    );
  }

  void showSuccessSnackbar(String message, {String? title}) {
    _snackbarService.showCustomSnackBar(
      message: message,
      title: title ?? 'Success',
      variant: SnackbarType.success,
      duration: Duration(seconds: 3),
    );
  }

  void showErrorSnackbar(String message, {String? title}) {
    _snackbarService.showCustomSnackBar(
      message: message,
      title: title ?? 'Error',
      variant: SnackbarType.error,
      duration: Duration(seconds: 5),
    );
  }

  void showInfoSnackbar(String message, {String? title}) {
    _snackbarService.showCustomSnackBar(
      message: message,
      title: title ?? 'Info',
      variant: SnackbarType.info,
      duration: Duration(seconds: 3),
    );
  }
}
