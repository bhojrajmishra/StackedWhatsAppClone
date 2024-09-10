import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:whats_app_clone/network/dio_client.dart';
import 'package:whats_app_clone/ui/views/registration/model/registration_request.dart';
import 'package:whats_app_clone/ui/views/registration/model/registration_response.dart';
import 'package:whats_app_clone/base/utils/api_path.dart';

class RegistrationService {
  static Future<RegistrationResponse?> requestRegisterApi(
      RegistrationRequest registrationRequest) async {
    final payload = {
      'email': registrationRequest.email,
      'full_name': registrationRequest.fullname,
      'password': registrationRequest.password,
    };
    debugPrint("Payload: $payload");
    // try {
    //   Response response = await DioClient.sharedDio.post(
    //     ApiPath.registerUrl,
    //     data: payload,
    //     options: Options(
    //       headers: {
    //         'Content-Type': 'application/json',
    //       },
    //     ),
    //   );

    //   if (response.statusCode == 200) {
    //     final data = response.data;
    //     return RegistrationResponse.fromJson(data);
    //   } else {
    //     debugPrint('Registration failed with status: ${response.statusCode}');
    //     return null;
    //   }
    // } catch (e) {
    //   debugPrint('Error: $e');
    //   return null;
    // }
  }
}
