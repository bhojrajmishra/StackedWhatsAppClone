// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:whats_app_clone/ui/views/registration/model/registration_response.dart';
// import 'package:whats_app_clone/ui/views/registration/repository/registration_repository.dart';

// class RegistrationRepositoryImpl implements RegistrationRepository {
//   final FirebaseAuth _firebaseAuth;

//   RegistrationRepositoryImpl(this._firebaseAuth);

//   @override
//   Future<RegistrationResponse> requestRegistration(
//       RegistrationRequest request) async {
//     try {
//       final userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
//         email: request.email,
//         password: request.password,
//       );
//       return RegistrationResponse(
//         email: userCredential.user?.email ?? '',
//         password: 0,
//       );
//     } catch (e) {
//       return RegistrationResponse(
//         email: '',
//         password: 0,
//       );
//     }
//   }
// }
