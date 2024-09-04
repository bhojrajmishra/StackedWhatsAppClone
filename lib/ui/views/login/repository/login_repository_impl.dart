import 'package:whats_app_clone/services/login_service.dart';
import 'package:whats_app_clone/ui/views/login/login_request.dart';
import 'package:whats_app_clone/ui/views/login/login_response.dart';
import 'package:whats_app_clone/ui/views/login/repository/login_repository.dart';

class LoginRepositoryImpl implements LoginRepository {
  @override
  Future<LoginResponse?> requestLoginApi(LoginRequest loginRequest) async {
    final loginService = LoginService();
    return await loginService.requestLoginApi(loginRequest);
  }

  @override
  Future<String?> getToken() async {
    final loginService = LoginService();
    return await loginService.getToken();
  }
}
