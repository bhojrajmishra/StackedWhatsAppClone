import 'package:dio/dio.dart';
import 'package:whats_app_clone/network/app_interceptor.dart';

class DioClient {
  static final Dio sharedDio = Dio();

  DioClient() {
    sharedDio.options = BaseOptions(
      baseUrl: 'https://tbe.thuprai.com/v1/api',
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 3),
    );

    sharedDio.interceptors.add(AppInterceptor());
  }
}
