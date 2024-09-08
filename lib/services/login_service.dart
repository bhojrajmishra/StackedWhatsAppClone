import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:whats_app_clone/network/dio_client.dart';
import 'package:whats_app_clone/ui/views/login/model/login_request.dart';
import 'package:whats_app_clone/ui/views/login/model/login_response.dart';
import 'package:whats_app_clone/base/utils/api_path.dart';

class LoginService {
  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  Future<LoginResponse?> requestLoginApi(LoginRequest loginRequest) async {
    final payload = {
      'username': loginRequest.email,
      'password': loginRequest.password,
    };
    try {
      Response response = await DioClient.sharedDio.post(
        ApiPath.loginUrl,
        data: payload,
      );

      if (response.statusCode == 200) {
        final data = response.data;
        await _storage.write(key: 'token', value: data['token']);
        debugPrint('token: ${data['token']}');
        debugPrint('username: ${loginRequest.email}');
        debugPrint('password: ${loginRequest.password}');
        return LoginResponse.fromJson(data);
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  Future<String?> getToken() async {
    return await _storage.read(key: 'token');
  }
}
