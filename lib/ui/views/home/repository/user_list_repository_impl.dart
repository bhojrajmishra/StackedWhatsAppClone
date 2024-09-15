import 'package:whats_app_clone/model/user_list_model.dart';
import 'package:whats_app_clone/ui/views/home/service/home_service.dart';
import 'package:whats_app_clone/ui/views/home/repository/user_list_repository.dart';

class UserListRepositoryImpl implements UserListRepository {
  @override
  Future<List<UserListModel>> getUserList() async {
    return await HomeService.fetchAllUsers();
  }
}
