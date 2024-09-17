import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:whats_app_clone/theme/custom_theme.dart';
import 'package:whats_app_clone/ui/views/chat/widgets/message_bubble.dart';
import 'package:whats_app_clone/ui/views/chat/widgets/message_input_row.dart';
import 'package:whats_app_clone/ui/widgets/user_app_bar.dart';

import 'chat_viewmodel.dart';

class ChatView extends StackedView<ChatViewModel> {
  final String title;
  final String userId;
  const ChatView({Key? key, required this.title, required this.userId})
      : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    ChatViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      appBar: UserAppBar(
        title: title,
        backgroundColor: CustomTheme.primary(context),
        foregroundColor: CustomTheme.inversePrimary(context),
        actions: [
          IconButton(
            icon: const Icon(Icons.attach_file_outlined),
            onPressed: () {},
            color: CustomTheme.inversePrimary(context),
          ),
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {},
            color: CustomTheme.inversePrimary(context),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              reverse: true,
              itemCount: viewModel.messages.length,
              itemBuilder: (context, index) {
                final message = viewModel.messages[index];
                final isUserMessage = message['userId'] == viewModel.user?.uid;
                return MessageBubble(
                  timestamp: message['timestamp']?.toDate() ?? DateTime.now(),
                  message: message['message'],
                  isUserMessage: isUserMessage,
                );
              },
            ),
          ),
          MessageInputRow(
            controller: viewModel.controller,
            onSendMessage: viewModel.sendMessage,
          ),
        ],
      ),
    );
  }

  @override
  ChatViewModel viewModelBuilder(BuildContext context) => ChatViewModel(userId);
}
