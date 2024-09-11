import 'dart:isolate';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class ChatViewModel extends BaseViewModel with Initialisable {
  @override
  Future<void> initialise() async {
    await fetchMessages();
  }

  final TextEditingController controller = TextEditingController();
  final List<String> messages = [];
  FirebaseFirestore db = FirebaseFirestore.instance;
  bool isUserMessage = true;

  Future<void> sendMessage() async {
    if (controller.text.isNotEmpty) {
      messages.add(controller.text);
      notifyListeners();
      await db.collection('messages').add({
        'message': controller.text,
        'isUserMessage': isUserMessage,
        'timestamp': DateTime.now(),
      });
      controller.clear();
    }
  }

  Future<void> fetchMessages() async {
    final snapshot = await db.collection('messages').get();
    messages.clear();
    if (snapshot.docs.isEmpty) {
      return;
    }
    for (final doc in snapshot.docs) {
      messages.add(doc['message']);
    }
    notifyListeners();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
