import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:whats_app_clone/ui/views/login/login_view.dart';
import 'package:whats_app_clone/ui/widgets/custom_button.dart';
import 'package:whats_app_clone/ui/widgets/custom_text_form_field.dart';
import 'package:whats_app_clone/utils/validator.dart';

import 'registration_viewmodel.dart';

class RegistrationView extends StackedView<RegistrationViewModel> {
  const RegistrationView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    RegistrationViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Registration Page"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const LoginView()),
            );
          },
        ),
      ),
      body: (Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Form(
                key: viewModel.formsKey,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    children: [
                      const SizedBox(height: 100, width: 100),
                      CustomTextFormField(
                        controller: viewModel.nameController,
                        labelText: "Full Name",
                        obscureText: false,
                        validator: (value) =>
                            Validator.userNameValidator(value),
                      ),
                      const SizedBox(height: 23),
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
                        validator: (value) =>
                            Validator.passwordValidator(value),
                      ),
                      const SizedBox(height: 23),
                      CustomButton(
                        text: "Register",
                        onPressed: () {
                          viewModel.requestRegisterApi();
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      )),
    );
  }

  @override
  RegistrationViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      RegistrationViewModel();
}
