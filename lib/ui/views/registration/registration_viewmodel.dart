import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:whats_app_clone/app/app.locator.dart';
import 'package:whats_app_clone/app/app.router.dart';
import 'package:whats_app_clone/ui/common/app_strings.dart';
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
  final _navigationService = locator<NavigationService>();
  final _snackbarService = locator<SnackbarService>();

  Future<void> requestRegisterApi() async {
    final fullname = nameController.text;
    final email = emailController.text;
    final password = passwordController.text;

    if (!formsKey.currentState!.validate()) {
      _snackbarService.showSnackbar(message: fillAllFieldsMessage);
      return;
    }

    setBusy(true);

    RegistrationRequest registrationModel = RegistrationRequest(
      fullname: fullname,
      email: email,
      password: password,
    );

    try {
      RegistrationResponse? registorResult =
          await _registrationRepository.requestRegisterApi(registrationModel);

      if (registorResult != null) {
        _handleSuccessfulRegister(registorResult);
        _navigationService.replaceWith(Routes.loginView);
      } else {
        _snackbarService.showSnackbar(message: registrationFailedMessage);
      }
    } catch (e) {
      _snackbarService.showSnackbar(
          message: 'An error occurred: ${e.toString()}');
    } finally {
      setBusy(false);
    }
  }

  void _handleSuccessfulRegister(RegistrationResponse registerResponse) {
    debugPrint('Registered as: ${registerResponse.fullName}');
    debugPrint('Token: ${registerResponse.token}');
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();
    super.dispose();
  }
}
