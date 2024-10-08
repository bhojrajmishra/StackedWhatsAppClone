import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:whats_app_clone/app/app.locator.dart';
import 'package:whats_app_clone/app/app.router.dart';
import 'package:whats_app_clone/ui/views/registration/widgets/registration_button.dart';
import 'package:whats_app_clone/ui/widgets/custom_button.dart';
import 'package:whats_app_clone/ui/widgets/custom_text_form_field.dart';
import 'package:whats_app_clone/base/utils/validator.dart';
import 'login_viewmodel.dart';

class LoginView extends StackedView<LoginViewModel> {
  LoginView({Key? key}) : super(key: key);
  final _navigation = locator<NavigationService>();

  @override
  Widget builder(
    BuildContext context,
    LoginViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 100, width: 100),
            Form(
              key: viewModel.formKey,
              child: Column(
                children: [
                  CustomTextFormField(
                    controller: viewModel.emailController,
                    labelText: "Email",
                    obscureText: false,
                    validator: (value) => Validator.emailValidator(value),
                  ),
                  const SizedBox(height: 23),
                  CustomTextFormField(
                    controller: viewModel.passwordController,
                    labelText: "Password",
                    obscureText: true,
                    validator: (value) => Validator.passwordValidator(value),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 23),
            CustomButton(
              text: viewModel.isBusy ? "Loading..." : "Login",
              onPressed: viewModel.requestLoginApi,
            ),
            const SizedBox(height: 20),
            const Text("Don't have an account?"),
            RegistrationButton(
              textData: "Register",
              onTap: () {
                _navigation.pushNamedAndRemoveUntil(
                  Routes.registrationView,
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  LoginViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      LoginViewModel();
}
