import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class ChatViewModel extends BaseViewModel with Initialisable {
  final String chatId;
  ChatViewModel(this.chatId);

  @override
  Future<void> initialise() async {
    await fetchMessages();
  }

  final TextEditingController controller = TextEditingController();
  final List<String> messages = ['hello'];
  FirebaseFirestore db = FirebaseFirestore.instance;
  User? user = FirebaseAuth.instance.currentUser;

  Future<void> sendMessage() async {
    if (controller.text.isNotEmpty && user != null) {
      final newMessage = {
        'message': controller.text,
        'userId': user!.uid,
        'isUserMessage': true,
        'timestamp': FieldValue.serverTimestamp(),
      };
      await db
          .collection('chats')
          .doc(chatId)
          .collection('messages')
          .add(newMessage);
      controller.clear();
      notifyListeners();
    }
  }

  Future<void> fetchMessages() async {
    db
        .collection('chats')
        .doc(chatId)
        .collection('messages')
        .orderBy('timestamp', descending: true)
        .limit(10)
        .snapshots(includeMetadataChanges: true)
        .listen((snapshot) {
      messages.clear();
      for (final doc in snapshot.docs) {
        final data = doc.data();
        data['id'] = doc.id;
        data['isUserMessage'] = data['userId'] == user?.uid;
        messages.add(data['message']);
      }
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
