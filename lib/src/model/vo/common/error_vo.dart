
class ErrorVo extends JsonClass {
  String message;
  String resultCode;
  int status;
  Map<String, dynamic>? data;

  ErrorVo({required this.message, required this.resultCode, required this.status, this.data});

  @override
  Map<String, dynamic> toJson() {
    Map<String, dynamic> jsonMap = {"message": message, "status": status, "data": data, "resultCode": resultCode};

    return jsonMap;
  }

  factory ErrorVo.fromJson(Map<String, dynamic> jsonMap) {
    ErrorVo errorVo = ErrorVo(message: jsonMap['msg'], status: jsonMap['code'], data: jsonMap['data'], resultCode: jsonMap['resultCode']);
    return errorVo;
  }
}
