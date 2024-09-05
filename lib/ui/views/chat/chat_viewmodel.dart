import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class ChatViewModel extends BaseViewModel {
  final TextEditingController controller = TextEditingController();
  final List<String> messages = [];
  bool isUserMessage = true;
  void sendMessage() {
    /// If the controller text is not empty then add the message to the list and clear the controller and change the isUserMessage to false
    if (controller.text.isNotEmpty) {
      //add the message to the list
      messages.add(controller.text);
      //clear the controller
      controller.clear();
      //change the isUserMessage to false
      isUserMessage = !isUserMessage;
      //notifyListeners to rebuild the UI
      notifyListeners();
    }
  }
}
