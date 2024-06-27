// ignore_for_file: constant_identifier_names

import 'dart:developer';

import 'package:dio/dio.dart';

const String AUTHORIZATION = "Authorization";
const String ACCESS_TOKEN = "accessToken";
const String REFRESH_TOKEN = "refreshToken";
const String USER_AGENT = "User-Agent";
const String TOKEN_PREFIX = 'Bearer';

class CustomHttpInterceptor extends QueuedInterceptorsWrapper {
  Dio dio;
  Dio reResponseDio = Dio();

  CustomHttpInterceptor({required this.dio});

  ///
  /// 모든 요청 인터셉터
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    log('HTTP REQUEST[${options.method}] => PATH: ${options.path}');
    handler.next(options);
  }

  ///
  /// 모든 응답 인터셉터
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) async {
    log('HTTP RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}');
    super.onResponse(response, handler);
  }

  ///
  /// 모든 에러 인터셉터
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    log('HTTP SERVER ERROR[${err.response?.statusCode}]}');
    handler.next(err);
  }
}
