
import 'package:code_sliver/src/model/vo/common/json_class.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';

class KakaoTokenVo implements JsonClass {
  String accessToken;
  DateTime accessTokenExpireTime;

  String? refreshToken;
  DateTime? refreshTokenExpireTime;

  KakaoTokenVo({required this.accessToken, required this.accessTokenExpireTime, required this.refreshToken, required this.refreshTokenExpireTime});

  @override
  Map<String, dynamic> toJson() {
    Map<String, dynamic> jsonMap = {
      "accessToken": accessToken,
      "accessTokenExpireTime": accessTokenExpireTime.toString(),
      "refreshToken": refreshToken.toString(),
      "refreshTokenExpireTime": refreshTokenExpireTime.toString()
    };
    return jsonMap;
  }

  static KakaoTokenVo fromKakao(OAuthToken oAuthToken) {
    KakaoTokenVo kakaoTokenVo = KakaoTokenVo(
      accessToken: oAuthToken.accessToken,
      accessTokenExpireTime: oAuthToken.expiresAt,
      refreshToken: oAuthToken.refreshToken,
      refreshTokenExpireTime: oAuthToken.refreshTokenExpiresAt,
    );
    return kakaoTokenVo;
  }
}
