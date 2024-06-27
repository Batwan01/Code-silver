import 'package:dio/dio.dart';

class DioVo {
  Response? response;
  DioException? dioError;
  bool isError = true;
  String? method;
  String? apiPath;

  DioVo({
    this.response,
    this.dioError,
    this.apiPath,
    this.method,
    this.isError = true,
  });

  factory DioVo.fromJson(Map<String, dynamic> jsonMap) {
    DioVo dioVo = DioVo(isError: false);
    Response response = Response(requestOptions: RequestOptions(), data: jsonMap['data']);
    dioVo.response = response;
    return dioVo;
  }

  factory DioVo.fromErr(dynamic e) {
    DioVo dioVo = DioVo(
      isError: true,
    );
    if (e is DioException) {
      DioException dioException = e;

      dioVo.apiPath = dioException.requestOptions.path;
      dioVo.method = dioException.requestOptions.method;
      dioVo.response = dioException.response;
      dioVo.dioError = dioException;
    }

    return dioVo;
  }
}
