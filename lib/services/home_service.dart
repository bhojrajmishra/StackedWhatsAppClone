import 'package:dio/dio.dart';
import 'package:whats_app_clone/model/user_list_model.dart';
import 'package:whats_app_clone/base/utils/api_path.dart';
import 'package:whats_app_clone/network/dio_client.dart';

class HomeService {
  static Future<List<UserListModel>> fetchUserList() async {
    try {
      Response response = await DioClient.sharedDio.get(ApiPath.userListUrl);
      final List<dynamic> data = response.data['data'];
      return data.map((json) => UserListModel.fromJson(json)).toList();
    } catch (e) {
      throw Exception('Failed to fetch user list: $e');
    }
  }
}
