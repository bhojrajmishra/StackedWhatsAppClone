import 'package:whats_app_clone/app/app.locator.dart';
import 'package:whats_app_clone/ui/views/registration/model/registration_request.dart';
import 'package:whats_app_clone/ui/views/registration/model/registration_response.dart';
import 'package:whats_app_clone/ui/views/registration/repository/registration_repository.dart';

class RegistrationService {
  final RegistrationRepository _repository = locator<RegistrationRepository>();

  Future<RegistrationResponse> requestRegistration(
      RegistrationRequest request) async {
    return await _repository.requestRegistration(request);
  }
}
