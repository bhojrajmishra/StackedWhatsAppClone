// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:whats_app_clone/app/app.locator.dart';
// import 'package:whats_app_clone/app/app.router.dart';
// import 'package:whats_app_clone/local_storage/storage_service.dart';
// import 'package:whats_app_clone/network/dio_client.dart';
// import 'package:whats_app_clone/ui/views/login/model/login_request.dart';
// import 'package:whats_app_clone/ui/views/login/model/login_response.dart';
// import 'package:whats_app_clone/base/utils/api_path.dart';

// class LoginService {
//   final StorageService _storageService = locator<StorageService>();

//   Future<LoginResponse?> requestLoginApi(LoginRequest loginRequest) async {
//     final payload = {
//       'username': loginRequest.email,
//       'password': loginRequest.password,
//     };
//     try {
//       Response response = await DioClient.sharedDio.post(
//         ApiPath.loginUrl,
//         data: payload,
//       );

//       if (response.statusCode == 200) {
//         final data = response.data;
//         await _storageService.write(key: 'token', value: data['token']);
//         (Routes.homeView);
//         debugPrint('token: ${data['token']}');
//         debugPrint('username: ${loginRequest.email}');
//         debugPrint('password: ${loginRequest.password}');
//         return LoginResponse.fromJson(data);
//       } else {
//         return null;
//       }
//     } catch (e) {
//       return null;
//     }
//   }

//   Future<String?> getToken() async {
//     return await _storageService.read(key: 'token');
//   }
// }
