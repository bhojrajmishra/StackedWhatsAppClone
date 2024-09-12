class UserListModel {
  final String email;
  // final String id;
  final String name;

  UserListModel({
    required this.email,
    // required this.id,
    required this.name,
  });
  // Convert a JSON map into a UserList object
  UserListModel.fromJson(Map<String, dynamic> json)
      : email = json['email'],
        // id = json['id'],
        name = json['name'];

  // Convert a UserList object into a JSON map
  Map<String, dynamic> toJson() {
    return {
      'email': email,
      // 'id': id,
      'name': name,
    };
  }
}
