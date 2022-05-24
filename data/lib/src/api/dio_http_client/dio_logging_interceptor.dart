// ignore_for_file: avoid_print

import 'package:dio/dio.dart';

class DioLoggingInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    print('''
===============================
Request:
${options.method}:
${options.uri}
${options.headers.entries}
${options.data}
''');
    super.onRequest(options, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    print('''
===============================
Error: 
${err.requestOptions.method}:
${err.requestOptions.uri}
${err.requestOptions.headers.entries}
${err.requestOptions.data}
${err.response?.statusCode} ${err.response?.statusMessage}
${err.error}
${err.response?.data}
''');
    super.onError(err, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    print('''
===============================
Response: 
${response.requestOptions.method}:
${response.requestOptions.uri}
${response.requestOptions.headers.entries}
${response.requestOptions.data}
${response.statusCode} ${response.statusMessage}
${response.data}
''');
    super.onResponse(response, handler);
  }
}