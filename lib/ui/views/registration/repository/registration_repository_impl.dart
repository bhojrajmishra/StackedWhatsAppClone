import 'package:whats_app_clone/services/registration_service.dart';
import 'package:whats_app_clone/ui/views/registration/model/registration_request.dart';
import 'package:whats_app_clone/ui/views/registration/model/registration_response.dart';
import 'package:whats_app_clone/ui/views/registration/repository/registration_repository.dart';

class RegistrationRepositoryImpl implements RegistrationRepository {
  @override
  Future<RegistrationResponse?> requestRegisterApi(
      RegistrationRequest registrationRequest) async {
    return await RegistrationService.requestRegisterApi(registrationRequest);
  }
}
