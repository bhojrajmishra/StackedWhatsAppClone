import 'package:whats_app_clone/app/app.locator.dart';
import 'package:whats_app_clone/ui/views/login/model/login_request.dart';
import 'package:whats_app_clone/ui/views/login/model/login_response.dart';
import 'package:whats_app_clone/ui/views/login/repository/login_repository.dart';

class LoginService {
  Future<LoginResponse> requestLogin(LoginRequest request) async {
    LoginRepository repository = locator<LoginRepository>();
    return await repository.requestLogin(request);
  }
}
