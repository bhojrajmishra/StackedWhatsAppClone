import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:whats_app_clone/app/app.locator.dart';
import 'package:whats_app_clone/app/app.router.dart';
import 'package:whats_app_clone/ui/views/login/login_request.dart';
import 'package:whats_app_clone/ui/views/login/login_response.dart';
import 'package:whats_app_clone/ui/views/login/repository/login_repository.dart';
import 'package:whats_app_clone/ui/views/login/repository/login_repository_impl.dart';

class LoginViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  // final _snackBarService = locator<SnackbarService>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final LoginRepository _loginRepository = LoginRepositoryImpl();

  Future<void> requestLoginApi() async {
    if (!formKey.currentState!.validate()) {
      return;
    }

    setBusy(true);

    LoginRequest loginRequest = LoginRequest(
      email: emailController.text,
      password: passwordController.text,
    );
    LoginResponse? loginResult =
        await _loginRepository.requestLoginApi(loginRequest);

    setBusy(false);
    if (loginResult != null) {
      _navigateToHome();
    } else {
      // _snackBarService.showSnackbar(message: 'Login failed');
    }
  }

  Future<void> checkLoginStatus() async {
    String? token = await _loginRepository.getToken();
    if (token != null) {
      _navigateToHome();
    }
  }

  void _navigateToHome() {
    _navigationService.pushNamedAndRemoveUntil(Routes.homeView);
  }
}
