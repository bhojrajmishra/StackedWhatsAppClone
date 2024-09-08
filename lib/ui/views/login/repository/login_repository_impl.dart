import 'package:whats_app_clone/app/app.locator.dart';
import 'package:whats_app_clone/local_storage/local_storage_service.dart';
import 'package:whats_app_clone/services/login_service.dart';
import 'package:whats_app_clone/ui/views/login/model/login_request.dart';
import 'package:whats_app_clone/ui/views/login/model/login_response.dart';
import 'package:whats_app_clone/ui/views/login/repository/login_repository.dart';

class LoginRepositoryImpl implements LoginRepository {
  final loginService = locator<LoginService>();
  @override
  Future<LoginResponse?> requestLoginApi(LoginRequest loginRequest) async {
    return await loginService.requestLoginApi(loginRequest);
  }

  @override
  Future<String?> getToken(LocalStorageService localStorageService) async {
    return await loginService.getToken();
  }
}
