import 'package:whats_app_clone/model/user_list_model.dart';

abstract class UserListRepository {
  Future<List<UserListModel>> getUserList();
}
