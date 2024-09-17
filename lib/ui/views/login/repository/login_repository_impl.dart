// login_repository_implementation.dart
import 'package:firebase_auth/firebase_auth.dart';
import 'package:whats_app_clone/ui/views/login/model/login_request.dart';
import 'package:whats_app_clone/ui/views/login/model/login_response.dart';
import 'package:whats_app_clone/ui/views/login/repository/login_repository.dart';

class LoginRepositoryImplementation implements LoginRepository {
  final _firebaseAuth = FirebaseAuth.instance;
  @override
  Future<LoginResponse> requestLogin(LoginRequest request) async {
    try {
      final userCredential = await _firebaseAuth.signInWithEmailAndPassword(
        email: request.email,
        password: request.password,
      );
      return LoginResponse(
        email: userCredential.user?.email ?? '',
        password: 0,
      );
    } catch (e) {
      throw Exception("erroe:$e");
    }
  }
}
