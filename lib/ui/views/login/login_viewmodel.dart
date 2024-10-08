import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:whats_app_clone/app/app.locator.dart';
import 'package:whats_app_clone/app/app.router.dart';
import 'package:whats_app_clone/ui/common/app_strings.dart';
import 'package:whats_app_clone/ui/views/login/repository/login_repository.dart';

import 'package:whats_app_clone/ui/views/login/model/login_request.dart';
import 'package:whats_app_clone/ui/views/registration/registration_view.form.dart';

class LoginViewModel extends BaseViewModel with $RegistrationView {
  final _navigationService = locator<NavigationService>();
  final _snackbarService = locator<SnackbarService>();
  final _loginRepository = locator<LoginRepository>();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Future<void> requestLoginApi() async {
    if (!formKey.currentState!.validate()) {
      _snackbarService.showSnackbar(message: 'Please enter valid data');
      return;
    }

    setBusy(true);
    try {
      final request = LoginRequest(
        email: emailController.text,
        password: passwordController.text,
      );
      final response = await _loginRepository.requestLogin(request);

      if (response.email.isNotEmpty) {
        _navigationService.pushNamedAndRemoveUntil(Routes.homeView);
        _snackbarService.showSnackbar(message: loginSuccessMessage);
      } else {
        _snackbarService.showSnackbar(message: loginFailedMessage);
      }
    } catch (e, s) {
      _snackbarService.showSnackbar(message: loginFailedMessage);
      debugPrint('An error occurred: ${e.toString()}');
      debugPrint('An error occurred: ${s.toString()}');
    } finally {
      setBusy(false);
    }
  }
}
