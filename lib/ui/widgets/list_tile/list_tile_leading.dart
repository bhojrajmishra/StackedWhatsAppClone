import 'package:flutter/material.dart';
import 'package:whats_app_clone/model/user_list_model.dart';

/// ListTileLeading is a StatelessWidget that is used to display the leading widget of ListTile.
///
/// The [chats] is a List of UserListModel.
class ListTileLeading extends StatelessWidget {
  final List<UserListModel> chats;
  final int index;
  const ListTileLeading({super.key, required this.chats, required this.index});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 20,
      child: Text(chats[index].name[0]),
    );
  }
}
