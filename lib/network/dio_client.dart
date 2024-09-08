import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class DioClient {
  // Create a Dio instance that can be used for making HTTP requests
  static final Dio sharedDio = Dio();

  // Constructor to configure Dio
  DioClient() {
    // Set default options for the Dio instance (like base URL and timeouts)
    sharedDio.options = BaseOptions(
      baseUrl:
          'https://tbe.thuprai.com/v1/api', // The base URL for API requests
      connectTimeout: const Duration(seconds: 5), // Timeout for connection
      receiveTimeout: const Duration(seconds: 3), // Timeout for receiving data
    );

    // Add interceptors to handle requests, responses, and errors
    sharedDio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          options.headers['Authorization'] =
              'Bearer token'; // Add token to headers
          debugPrint(
              'Request: ${options.method} ${options.path}'); // Log request details
          return handler.next(options); // Continue with the request
        },
        onResponse: (response, handler) {
          debugPrint(
              'Response: ${response.statusCode} ${response.data}'); // Log response details
          return handler.next(response); // Continue with the response
        },
        onError: (DioException e, handler) {
          debugPrint('Error: ${e.message}'); // Log error details
          return handler.next(e); // Handle the error
        },
      ),
    );
  }
}

class AppIntercepter implements InterceptorsWrapper {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    debugPrint('Interceptor: Error occurred for ${err.requestOptions.path}');
    handler.next(err);
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers['Authorization'] = 'Bearer token';
    debugPrint('Interceptor: Sending request to ${options.path}');
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    debugPrint(
        'Interceptor: Received response from ${response.requestOptions.path}');
    handler.next(response);
  }
}
