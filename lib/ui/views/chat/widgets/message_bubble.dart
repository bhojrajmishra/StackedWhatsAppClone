import 'package:flutter/material.dart';
import 'package:whats_app_clone/theme/custom_theme.dart';

/// A custom MessageBubble widget to display the message in the chat screen.
///
/// This widget is used in the ChatView screen to display chat messages.
/// Example can assume:
/// ```dart
/// MessageBubble(
///  message: 'Hello, how are you?',
/// isUserMessage: true,
/// )
/// ```
/// The MessageBubble widget takes [message] and [isUserMessage] as parameters
/// and returns a styled container with the message text.
class MessageBubble extends StatelessWidget {
  // The message text to display in the bubble.
  final String message;
  final int? timestamp;
  // A boolean value to determine if the message is sent by the user or received from another user.
  final bool isUserMessage;

  /// Constructor for [MessageBubble].
  const MessageBubble({
    required this.message,
    required this.isUserMessage,
    this.timestamp,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      // Align the message bubble based on the user message status.
      alignment: isUserMessage ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        // Styling for the message bubble container.
        margin: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
        padding: const EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          // Set the background color and border radius based on the user message status.
          color: isUserMessage
              ? CustomTheme.primary(context)
              : CustomTheme.secondary(context),
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(12),
            topRight: const Radius.circular(12),
            bottomLeft: isUserMessage ? const Radius.circular(12) : Radius.zero,
            bottomRight:
                // Set the border radius based on the user message status.
                isUserMessage ? Radius.zero : const Radius.circular(12),
          ),
        ),
        child: Text(
          message + (timestamp != null ? ' - $timestamp' : ''),
          style: TextStyle(
            // Set the text color based on the user message status.
            color: isUserMessage
                ? CustomTheme.inversePrimary(context)
                : CustomTheme.inversePrimary(context),
          ),
        ),
      ),
    );
  }
}
