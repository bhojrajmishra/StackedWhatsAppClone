import 'package:whats_app_clone/ui/views/login/model/login_request.dart';
import 'package:whats_app_clone/ui/views/login/model/login_response.dart';
import 'package:whats_app_clone/ui/views/login/repository/login_repository.dart';

class LoginService {
  final LoginRepository _repository;

  LoginService(this._repository);

  Future<LoginResponse> requestLogin(LoginRequest request) async {
    return await _repository.requestLogin(request);
  }
}
