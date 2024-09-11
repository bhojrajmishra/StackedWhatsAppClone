import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:whats_app_clone/model/user_list_model.dart';
import 'package:whats_app_clone/base/utils/api_path.dart';
import 'package:whats_app_clone/network/dio_client.dart';

class HomeService {
  static Future<List<UserListModel>> fetchUserList() async {
    try {
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
