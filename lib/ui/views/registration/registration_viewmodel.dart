import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:whats_app_clone/app/app.locator.dart';
import 'package:whats_app_clone/app/app.router.dart';
import 'package:whats_app_clone/ui/common/app_strings.dart';

class RegistrationViewModel extends BaseViewModel {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final GlobalKey<FormState> formsKey = GlobalKey<FormState>();

  final _navigationService = locator<NavigationService>();
  final _snackbarService = locator<SnackbarService>();

  Future<void> requestRegisterApi() async {
    if (!formsKey.currentState!.validate()) {
      _snackbarService.showSnackbar(message: fillAllFieldsMessage);

      return;
    }
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
      var userId = FirebaseAuth.instance.currentUser!.uid;
      var db = FirebaseFirestore.instance;
      db.collection("users").doc(userId.toString()).set({
        "name": nameController.text,
        "email": emailController.text,
        "password": passwordController.text,
        "id": userId.toString(),
      });

      _navigationService.replaceWith(Routes.loginView);
      _snackbarService.showSnackbar(message: registrationSuccessMessage);
    } catch (e) {
      _snackbarService.showSnackbar(
          message: registrationFailedMessage,
          duration: const Duration(seconds: 2));
      debugPrint('An error occurred: ${e.toString()}');
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
