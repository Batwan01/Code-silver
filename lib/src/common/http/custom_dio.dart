// ignore_for_file: non_constant_identifier_names

import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:code_sliver/src/common/http/dio_interceptor/custom_http_insterceptor.dart';
import 'package:code_sliver/src/model/enum/env_enum.dart';
import 'package:code_sliver/src/model/vo/common/dio_vo.dart';

class CustomDio {
  static final CustomDio _instance = CustomDio._internal();
  String BASE_URI = dotenv.get(EnvEnum.BASE_URI.name);

  Dio dio = Dio();
  static Dio tokenDio = Dio(); // 토큰 재발급 용

  factory CustomDio() {
    return _instance;
  }

  CustomDio._internal() {
    log("Singleton Instance Created <CustomDio>");
  }

  void init() {
    dio.interceptors.addAll([
      CustomHttpInterceptor(dio: dio),
    ]);
  }


  ///
  /// Get
  Future<DioVo> get({required String path, required Map<String, dynamic> param, Options? options}) async {
    DioVo dioVo = DioVo();
    dioVo.method = 'GET';
    dioVo.apiPath = path;
    try {
      Response response = await dio.get(path, queryParameters: param, options: options);
      dioVo.response = response;
      dioVo.isError = false;

      return dioVo;
    } catch (e) {
      DioException dioException = e as DioException;
      dioVo.dioError = dioException;
      dioVo.isError = true;
      return dioVo;
    }
  }

  ///
  /// Post
  Future<DioVo> post({required String path, Map<String, dynamic>? param, required Map<String, dynamic> body, Options? options}) async {
    DioVo dioVo = DioVo();
    dioVo.method = 'POST';
    dioVo.apiPath = path;
    try {
      Response response = await dio.post(path, queryParameters: param, data: body, options: options);
      dioVo.response = response;
      dioVo.isError = false;

      return dioVo;
    } catch (e) {
      DioException dioException = e as DioException;
      dioVo.dioError = dioException;
      dioVo.isError = true;
      return dioVo;
    }
  }

  ///
  /// Put
  Future<DioVo> put({required String path, required Map<String, dynamic> body}) async {
    DioVo dioVo = DioVo();
    dioVo.method = 'PUT';
    dioVo.apiPath = path;
    try {
      Response response = await dio.post(path, data: body);
      dioVo.response = response;
      dioVo.isError = false;

      return dioVo;
    } catch (e) {
      DioException dioException = e as DioException;
      dioVo.dioError = dioException;
      dioVo.isError = true;
      return dioVo;
    }
  }

  ///
  /// Delete
  Future<DioVo> delete({required String path, required Map<String, dynamic> body}) async {
    DioVo dioVo = DioVo();
    dioVo.method = 'DELETE';
    dioVo.apiPath = path;
    try {
      Response response = await dio.post(path, data: body);
      dioVo.response = response;
      dioVo.isError = false;

      return dioVo;
    } catch (e) {
      DioException dioException = e as DioException;
      dioVo.dioError = dioException;
      dioVo.isError = true;
      return dioVo;
    }
  }
}
