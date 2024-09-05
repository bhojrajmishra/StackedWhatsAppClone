import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:whats_app_clone/constant/constants_validation.dart';
import 'package:whats_app_clone/ui/views/login/login_view.dart';
import 'package:whats_app_clone/ui/views/registration/model/registration_request.dart';
import 'package:whats_app_clone/ui/views/registration/model/registration_response.dart';
import 'package:whats_app_clone/ui/views/registration/repository/registration_repository.dart';
import 'package:whats_app_clone/ui/views/registration/repository/registration_repository_impl.dart';

class RegistrationViewModel extends BaseViewModel {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final GlobalKey<FormState> formsKey = GlobalKey<FormState>();
  final RegistrationRepository _registrationRepository =
      RegistrationRepositoryImpl();

  Future<void> requestRegisterApi(BuildContext context) async {
    final fullname = nameController.text;
    final email = emailController.text;
    final password = passwordController.text;

    if (!formsKey.currentState!.validate()) {
      _showSnackBar(context, ConstantsValidation.fillAllFieldsMessage);
      return;
    }

    busy(true);

    RegistrationRequest registrationModel = RegistrationRequest(
      fullname: fullname,
      email: email,
      password: password,
    );

    RegistrationResponse? registorResult =
        await _registrationRepository.requestRegisterApi(registrationModel);

    busy(false);

    if (!context.mounted) return;

    if (registorResult != null) {
      _handleSuccessfullRegistor(registorResult);
      _navigateToLogin(context);
    } else {
      _showSnackBar(context, ConstantsValidation.registrationFailedMessage);
    }
  }

  void _handleSuccessfullRegistor(RegistrationResponse registerResponse) {
    // Here you can handle the successful login
    debugPrint('Logged in as: ${registerResponse.fullName}');
    debugPrint('Token: ${registerResponse.token}');
    // Add more handling as needed
  }

  void _showSnackBar(BuildContext context, String message) {
    if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(message)),
      );
    }
  }

  void _navigateToLogin(BuildContext context) {
    if (context.mounted) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginView()),
      );
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();
    super.dispose();
  }
}
