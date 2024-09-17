import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:whats_app_clone/app/app.locator.dart';
import 'package:whats_app_clone/model/user_list_model.dart';

class HomeService {
  static Future<List<UserListModel>> fetchAllUsers() async {
    try {
      final currentUser = locator<FirebaseAuth>().currentUser;
      if (currentUser == null) {
        throw Exception('No user logged in');
      }

      final QuerySnapshot<Map<String, dynamic>> snapshot =
          await FirebaseFirestore.instance.collection('users').get();

      return snapshot.docs
          .map((doc) => UserListModel.fromJson(doc.data()))
          .toList();
    } catch (e) {
      throw Exception('Failed to fetch user list: $e');
    }
  }
}
