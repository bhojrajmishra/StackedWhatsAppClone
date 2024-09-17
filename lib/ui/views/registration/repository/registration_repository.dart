import 'package:whats_app_clone/ui/views/registration/model/registration_request.dart';
import 'package:whats_app_clone/ui/views/registration/model/registration_response.dart';

abstract class RegistrationRepository {
  Future<RegistrationResponse> requestRegistration(RegistrationRequest request);
}
