import 'package:whats_app_clone/ui/views/login/login_request.dart';
import 'package:whats_app_clone/ui/views/login/login_response.dart';

abstract class LoginRepository {
  Future<LoginResponse?> requestLoginApi(LoginRequest loginRequest);
  Future<String?> getToken();
}
