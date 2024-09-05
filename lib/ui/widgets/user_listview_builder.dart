import 'package:flutter/material.dart';
import 'package:whats_app_clone/ui/widgets/user_list_tile.dart';

/// A custom listview bulder widget that displays a list of [UserListTile] widgets.
///
/// This widget can be used in a user view screen or any other screen where you need a list of list tiles.
/// The [UserListviewbuilder] takes [status] and [icon] as parameters and returns a [ListView.builder] with the specified properties.
class UserListviewbuilder extends StatefulWidget {
  ///The list of status strings to display in the list view.
  final List<String> status;
  final IconData icon;

  /// Required parameters [status]and [icon] to create a [UserListviewbuilder] widget.
  const UserListviewbuilder({
    super.key,
    required this.status,
    required this.icon,
  });

  @override
  State<UserListviewbuilder> createState() => _UserListviewbuilderState();
}

class _UserListviewbuilderState extends State<UserListviewbuilder> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.status.length, //The number of items in the list view
      itemBuilder: (BuildContext context, index) {
        //Builds each list tile with the specified status and icon
        return UserListTile(
          text: widget.status[index], //The status text
          icon: widget.icon, //The icon to display
        );
      },
    );
  }
}
