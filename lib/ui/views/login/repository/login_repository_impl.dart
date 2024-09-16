// login_repository_implementation.dart
import 'package:firebase_auth/firebase_auth.dart';
import 'package:whats_app_clone/ui/views/login/model/login_request.dart';
import 'package:whats_app_clone/ui/views/login/model/login_response.dart';
import 'package:whats_app_clone/ui/views/login/repository/login_repository.dart';

class LoginRepositoryImplementation implements LoginRepository {
  final FirebaseAuth _firebaseAuth;

  LoginRepositoryImplementation(this._firebaseAuth);

  @override
  Future<LoginResponse> requestLogin(LoginRequest request) async {
    try {
      final userCredential = await _firebaseAuth.signInWithEmailAndPassword(
        email: request.email,
        password: request.password,
      );
      return LoginResponse(
        email: userCredential.user?.email ?? '',
        password:
            0, // This is for the to return passwordd in int. We can change it to string if we want to return password in string
      );
    } catch (e) {
      // Handle error case
      return LoginResponse(
        email: '', // Return an empty string for email in case of error
        password: 0, // Return 0 for password in case of error
      );
    }
  }
}
