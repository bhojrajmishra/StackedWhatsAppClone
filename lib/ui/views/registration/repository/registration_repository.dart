import 'package:whats_app_clone/ui/views/registration/model/registration_request.dart';

abstract class RegistrationRepository {
  Future<void> requestRegistration(RegistrationRequest request);
}
