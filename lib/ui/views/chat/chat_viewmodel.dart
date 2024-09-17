import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class ChatViewModel extends BaseViewModel with Initialisable {
  final String userId;
  late String chatId;
  ChatViewModel(this.userId);

  @override
  Future<void> initialise() async {
    await _setChatId();
    await fetchMessages();
  }

  final TextEditingController controller = TextEditingController();
  final List messages = [];
  FirebaseFirestore db = FirebaseFirestore.instance;
  User? user = FirebaseAuth.instance.currentUser;

//make unique chatId for the chat between two users by soring and joining the two users in the chat
  Future<void> _setChatId() async {
    final users = [user!.uid, userId];
    users
        .sort(); // This is for the sorting the user according to alphaabetic order
    chatId = users.join(
        '_'); // This is for the join the users to arrange the chatId and make it unique for the chat and _ serpate the two users

    // After sorting, this will always produce the same chatId for the same pair of users
  }

  Future<void> sendMessage() async {
    if (controller.text.isNotEmpty && user != null) {
      final newMessage = {
        'message': controller.text,
        'userId': user!.uid,
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
        .limit(50)
        .snapshots()
        .listen((snapshot) {
      messages.clear();
      for (final doc in snapshot.docs) {
        final data = doc.data();
        data['id'] = doc.id;
        messages.add(data);
      }
      notifyListeners();
    });
  }

  Future<void> deleteMessage(String messageId) async {
    await db
        .collection('chats')
        .doc(chatId)
        .collection('messages')
        .doc(messageId)
        .delete();
    notifyListeners();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
