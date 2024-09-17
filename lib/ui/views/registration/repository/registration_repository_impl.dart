import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:whats_app_clone/ui/views/registration/model/registration_request.dart';
import 'package:whats_app_clone/ui/views/registration/model/registration_response.dart';
import 'package:whats_app_clone/ui/views/registration/repository/registration_repository.dart';

class RegistrationRepositoryImplementation implements RegistrationRepository {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Future<RegistrationResponse> requestRegistration(
      RegistrationRequest request) async {
    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: request.email,
        password: request.password,
      );

      String userId = userCredential.user!.uid;

      await _firestore.collection("users").doc(userId).set({
        "name": request.fullname,
        "email": request.email,
        "id": userId,
      });

      return RegistrationResponse(
        fullName: request.fullname,
        email: request.email,
        password: request.password,
      );
    } catch (e) {
      throw Exception('Registration failed: $e');
    }
  }
}
