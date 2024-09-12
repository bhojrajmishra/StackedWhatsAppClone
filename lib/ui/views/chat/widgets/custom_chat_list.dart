import 'package:flutter/material.dart';
import 'package:whats_app_clone/model/user_list_model.dart';
import 'package:whats_app_clone/ui/views/chat/chat_view.dart';
import 'package:whats_app_clone/ui/widgets/list_tile/list_tile_leading.dart';
import 'package:whats_app_clone/ui/widgets/list_tile/list_tile_title.dart';
import 'package:whats_app_clone/ui/widgets/list_tile/list_title_subtitle.dart';
import 'package:whats_app_clone/ui/widgets/list_tile/list_trailing.dart';

class CustomChatList extends StatelessWidget {
  final List<UserListModel> chats;
  final VoidCallback onRefresh;

  const CustomChatList({
    required this.chats,
    required this.onRefresh,
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        onRefresh();
      },
      child: ListView.builder(
        itemCount: chats.length,
        itemBuilder: (BuildContext context, index) {
          return ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ChatView(
                      title: chats[index].email,
                    ),
                  ),
                );
              },
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 10,
              ),
              leading: ListTileLeading(chats: chats, index: index),
              title: ListTileTitle(index: index, chats: chats),
              subtitle: ListTileTitleSubtitle(index: index, chats: chats),
              trailing: ListTrailing(chats: chats, index: index));
        },
      ),
    );
  }
}
