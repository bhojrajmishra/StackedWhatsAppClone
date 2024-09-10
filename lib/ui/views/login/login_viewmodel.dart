import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:whats_app_clone/app/app.locator.dart';
import 'package:whats_app_clone/app/app.router.dart';
import 'package:whats_app_clone/ui/common/app_strings.dart';
import 'package:whats_app_clone/ui/views/login/model/login_request.dart';
import 'package:whats_app_clone/ui/views/login/model/login_response.dart';
import 'package:whats_app_clone/ui/views/login/repository/login_repository.dart';
import 'package:whats_app_clone/ui/views/login/repository/login_repository_impl.dart';

class LoginViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _snackbarService = locator<SnackbarService>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final LoginRepository _loginRepository = LoginRepositoryImpl();

  Future<void> requestLoginApi() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
      _navigationService.pushNamedAndRemoveUntil(Routes.homeView);

      _snackbarService.showSnackbar(message: loginSuccessMessage);

      if (!formKey.currentState!.validate()) {
        _snackbarService.showSnackbar(message: loginFailedMessage);
        return;
      }
    } catch (e) {
      _snackbarService.showSnackbar(message: registrationFailedMessage);
      debugPrint('An error occurred: ${e.toString()}');
    }
  }

  // Future<void> requestLoginApi() async {
  //   if (!formKey.currentState!.validate()) {
  //     _snackbarService.showSnackbar(message: 'Please enter valid data');
  //     return;
  //   }

  //   setBusy(true);

  //   LoginRequest loginRequest = LoginRequest(
  //     email: emailController.text,
  //     password: passwordController.text,
  //   );
  //   LoginResponse? loginResult =
  //       await _loginRepository.requestLoginApi(loginRequest);

  //   _snackbarService.showSnackbar(message: 'User logged in');
  //   setBusy(false);
  //   if (loginResult != null) {
  //     _navigateToHome();
  //   } else {
  //     _snackbarService.showSnackbar(message: 'Login failed');
  //   }
  // }

  // Future<void> checkLoginStatus() async {
  //   String? token = await _loginRepository.getToken();
  //   if (token != null) {
  //     _navigateToHome();
  //   }
  // }

  // void _navigateToHome() {
  //   _navigationService.pushNamedAndRemoveUntil(Routes.homeView);
  // }
}
