import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:whats_app_clone/app/app.locator.dart';
import 'package:whats_app_clone/app/app.router.dart';
import 'package:whats_app_clone/ui/common/app_strings.dart';

class LoginViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _snackbarService = locator<SnackbarService>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Future<void> requestLoginApi() async {
    if (!formKey.currentState!.validate()) {
      _snackbarService.showSnackbar(message: 'Please enter valid data');
      return;
    }

    setBusy(true);

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );

      _navigationService.pushNamedAndRemoveUntil(Routes.homeView);
      _snackbarService.showSnackbar(message: loginSuccessMessage);
    } catch (e) {
      _snackbarService.showSnackbar(message: loginFailedMessage);
      debugPrint('An error occurred: ${e.toString()}');
    } finally {
      setBusy(false);
    }
  }
}
