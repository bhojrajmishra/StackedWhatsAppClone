import 'package:flutter/material.dart';
import 'package:whats_app_clone/model/user_list_model.dart';
import 'package:whats_app_clone/theme/custom_theme.dart';

///The ListTrailing is a StatelessWidget that is used to display the trailing widget of ListTile.
///
///The [chats] is a List of UserListModel.
class ListTrailing extends StatelessWidget {
  final List<UserListModel> chats;
  final int index;

  ///The constructor requires [chats] and [index].
  const ListTrailing({super.key, required this.chats, required this.index});
  @override
  Widget build(BuildContext context) {
    return //Text(chats[index].id.toString());
        Icon(
      Icons.arrow_forward_ios,
      color: CustomTheme.primary(context),
    );
  }
}
