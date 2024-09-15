import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:whats_app_clone/app/app.locator.dart';
import 'package:whats_app_clone/app/app.router.dart';
import 'package:stacked_services/stacked_services.dart';

class SettingViewModel extends BaseViewModel with Initialisable {
  final SnackbarService snackbarService = locator<SnackbarService>();
  final NavigationService _navigationService = locator<NavigationService>();

  Map<String, dynamic>? userData;
  FirebaseFirestore db = FirebaseFirestore.instance;

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  SettingViewModel() {
    nameController = TextEditingController();
    emailController = TextEditingController();
  }

  @override
  Future<void> initialise() async {
    await getUserData();
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    super.dispose();
  }

  Future<void> logout() async {
    await FirebaseAuth.instance.signOut();
    debugPrint('User logged out');
    snackbarService.showSnackbar(message: 'User logged out');
    _navigationService.pushNamedAndRemoveUntil(Routes.loginView);
  }

  Future<void> getUserData() async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        final response = await db.collection('users').doc(user.uid).get();
        userData = response.data();
        nameController.text = userData?['name'] ?? '';
        emailController.text = userData?['email'] ?? '';
        notifyListeners();
      }
    } catch (e) {
      debugPrint('Error: $e');
    }
  }

  Future<void> updateUserData() async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        await db.collection('users').doc(user.uid).update({
          'name': nameController.text,
          'email': emailController.text,
        });
        snackbarService.showSnackbar(
            message: 'User data updated successfully',
            duration: const Duration(seconds: 2));
        await getUserData();
      }
    } catch (e) {
      debugPrint('Error: $e');
    }
  }

  Future<void> deleteAccount() async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        await user.delete();
        await db.collection('users').doc(user.uid).delete();
        snackbarService.showSnackbar(
            message: 'Account deleted successfully',
            duration: const Duration(seconds: 2));
        _navigationService.pushNamedAndRemoveUntil(Routes.loginView);
      }
    } catch (e) {
      snackbarService.showSnackbar(
          message: 'Error deleting account: $e',
          duration: const Duration(seconds: 2));
      debugPrint('Error: $e');
    }
  }
}
