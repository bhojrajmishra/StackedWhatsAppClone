import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:whats_app_clone/ui/views/home/home_view.dart';
import 'package:whats_app_clone/ui/views/login/login_request.dart';
import 'package:whats_app_clone/ui/views/login/login_response.dart';
import 'package:whats_app_clone/ui/views/login/repository/login_repository.dart';
import 'package:whats_app_clone/ui/views/login/repository/login_repository_impl.dart';

class LoginViewModel extends BaseViewModel {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final LoginRepository _loginRepository = LoginRepositoryImpl();

  Future<void> requestLoginApi(BuildContext context) async {
    if (!formKey.currentState!.validate()) {
      _showSnackBar(context, 'Please fill all fields');
      return;
    }

    //  updateLoading(loading: true);

    LoginRequest loginRequest = LoginRequest(
      email: emailController.text,
      password: passwordController.text,
    );
    LoginResponse? loginResult =
        await _loginRepository.requestLoginApi(loginRequest);

    // updateLoading(loading: false);

    if (!context.mounted) return;
    if (loginResult != null) {
      _navigateToHome(context);
    } else {
      _showSnackBar(context, 'Login failed');
    }
  }

  Future<void> checkLoginStatus(BuildContext context) async {
    String? token = await _loginRepository.getToken();
    if (token != null && context.mounted) {
      _navigateToHome(context);
    }
  }

  void _showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  void _navigateToHome(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const HomeView()),
    );
  }
}
