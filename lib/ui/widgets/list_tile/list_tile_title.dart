import 'package:flutter/material.dart';
import 'package:whats_app_clone/model/user_list_model.dart';

/// ListTileTitle is a StatelessWidget that is used to display the title widget of ListTile.
///
/// The [chats] is a list of UserListModel.
class ListTileTitle extends StatelessWidget {
  final int index;
  final List<UserListModel> chats;

  /// The constructor requires [index] and [chats].
  const ListTileTitle({super.key, required this.index, required this.chats});

  @override
  Widget build(BuildContext context) {
    return Text(chats[index].email,
        style: const TextStyle(fontWeight: FontWeight.bold));
  }
}
