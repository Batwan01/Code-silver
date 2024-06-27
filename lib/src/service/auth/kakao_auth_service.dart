import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:code_sliver/src/common/http/custom_dio.dart';
import 'package:code_sliver/src/model/vo/common/dio_vo.dart';
import 'package:code_sliver/src/model/vo/auth/kakao_token_vo.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';

class KakaoAuthService {
  ///
  /// 카카오톡 로그인 시도 - 설치 유무에 따른 분기 동작
  Future<String> reqKakaoLogin() async {
    bool isKakaoInstalled = await isKakaoTalkInstalled();

    KakaoTokenVo? kakaoTokenVo = isKakaoInstalled ? await loginKakaoTalk() : await loginKakaoAccount();
    if(kakaoTokenVo != null){
      /// 카카오 api요청
      ///
      Map<String, dynamic> headerMap = {
        "Authorization": "Bearer ${kakaoTokenVo.accessToken}"
      };
      DioVo dioVo = await CustomDio().post(path: "https://kapi.kakao.com/v2/user/me", body: {}, options: Options(headers: headerMap));

      String kakaoId = dioVo.response!.data["id"].toString();
      try{
        UserCredential userCredential =  await FirebaseAuth.instance.signInWithEmailAndPassword(email: "$kakaoId@himama.com", password: kakaoId);
        return userCredential.user!.uid;
      }catch(e){
        await FirebaseAuth.instance.createUserWithEmailAndPassword(email: "$kakaoId@himama.com", password: kakaoId);
        UserCredential userCredential =  await FirebaseAuth.instance.signInWithEmailAndPassword(email: "$kakaoId@himama.com", password: kakaoId);
        return userCredential.user!.uid;
      }
    }

    return "";
  }

  ///
  /// 카카오톡 어플 통해서
  Future<KakaoTokenVo?> loginKakaoTalk() async {
    KakaoTokenVo? kakaoTokenVo;
    try {
      log("카카오톡 설치 되어 있음.");

      OAuthToken oAuthToken = await UserApi.instance.loginWithKakaoTalk();
      kakaoTokenVo = KakaoTokenVo.fromKakao(oAuthToken);

      log(
        "카카오톡 로그인 성공 :: ${kakaoTokenVo.toJson()}",
      );
    } catch (e) {
      log("카카오톡 로그인 실패 :: $e");
      if (e is PlatformException && e.code == 'CANCELED') {
        return null;
      }

      if (e is PlatformException && e.code == 'NotSupportError') {
        KakaoTokenVo? kakaoTokenVo = await loginKakaoAccount();
        return kakaoTokenVo;
      }
    }
    return kakaoTokenVo;
  }

  ///
  /// 카카오 계정 통해서
  Future<KakaoTokenVo?> loginKakaoAccount() async {
    KakaoTokenVo? kakaoTokenVo;
    try {
      log("카카오톡 미설치");

      OAuthToken oAuthToken = await UserApi.instance.loginWithKakaoAccount();
      kakaoTokenVo = KakaoTokenVo.fromKakao(oAuthToken);

      log("카카오톡 로그인 성공 :: ${kakaoTokenVo.toJson()}");
    } catch (e) {
      log(
        "카카오톡 로그인 실패 :: $e",
      );
      if (e is PlatformException && e.code == 'CANCELED') {
        return null;
      }
    }
    return kakaoTokenVo;
  }


}
