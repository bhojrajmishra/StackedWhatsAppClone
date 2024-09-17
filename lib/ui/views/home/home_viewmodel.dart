import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:whats_app_clone/app/app.locator.dart';
import 'package:whats_app_clone/model/user_list_model.dart';
import 'package:stacked/stacked.dart';
import 'package:whats_app_clone/ui/views/home/repository/user_list_repository_impl.dart';

class HomeViewModel extends BaseViewModel with Initialisable {
  final userListRepositoryImpl = locator<UserListRepositoryImpl>();
  User? user = FirebaseAuth.instance.currentUser;
  @override
  Future<void> initialise() async {
    await fetchUserList();
  }

  List<UserListModel> chats = [];

  Future<void> fetchUserList() async {
    setBusy(true);
    try {
      chats = await userListRepositoryImpl.getUserList();
    } catch (e) {
      debugPrint('Error: $e');
    } finally {
      setBusy(false);
    }
  }
}
