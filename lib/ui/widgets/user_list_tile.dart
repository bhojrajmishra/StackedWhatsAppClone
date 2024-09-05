import 'package:flutter/material.dart';

/// A custom list tile widget that displays a [ListTile] with an icon, text, and an optional onTap function.
///
/// This widget can be used in a user view screen or any other screen where you need a simple list tile
/// with an icon and text. The [UserListTile] takes [text], [icon], and [onTap] as parameters
/// and returns a [ListTile] with the specified properties.
///
/// ### Example:
/// ```dart
/// UserListTile(
///   text: 'Settings',
///   icon: Icons.settings,
///   onTap: () {
///     // Handle tap event
///   },
/// )
/// ```
class UserListTile extends StatelessWidget {
  /// The text to display in the list tile.
  final String text;

  /// The icon to display at the start (leading) of the list tile.
  final IconData icon;

  /// The function to execute when the list tile is tapped. This is optional.
  final VoidCallback? onTap;

  /// Constructor for [UserListTile].
  ///
  /// The [text] and [icon] parameters are required, while [onTap] is optional.
  const UserListTile({
    required this.text,
    required this.icon,
    this.onTap,
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      title: Text(text),
      leading: Icon(icon),
    );
  }
}
