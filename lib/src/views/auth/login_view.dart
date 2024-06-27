import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:code_sliver/src/common/config/device/device_info.dart';
import 'package:code_sliver/src/common/firebase/firebase_fcm.dart';
import 'package:code_sliver/src/common/prefs/impl/custom_prefs.dart';
import 'package:code_sliver/src/common/theme/custom_icon.dart';
import 'package:code_sliver/src/model/entity/auth/user_model.dart';
import 'package:code_sliver/src/model/enum/auth_type_enum.dart';
import 'package:code_sliver/src/model/enum/prefs_enum.dart';
import 'package:code_sliver/src/provider/auth/auth_provider.dart';
import 'package:code_sliver/src/provider/common/will_pop_provider.dart';
import 'package:code_sliver/src/repository/auth/auth_repository.dart';
import 'package:code_sliver/src/service/auth/apple_auth_service.dart';
import 'package:code_sliver/src/service/auth/facebook_auth_service.dart';
import 'package:code_sliver/src/service/auth/google_auth_service.dart';
import 'package:code_sliver/src/service/auth/kakao_auth_service.dart';
import 'package:code_sliver/src/widget/bar/app_bar/top_app_bar.dart';
import 'package:code_sliver/src/widget/layout/default_layout.dart';
import 'package:code_sliver/src/widget/snackbar/custom_snackbar.dart';

class LoginView extends ConsumerStatefulWidget {
  static String get routeName => '/login';

  const LoginView({super.key});

  @override
  ConsumerState<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends ConsumerState<LoginView> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        ref.read(willPopProvider.notifier).twiceBackAppOutHandler(context: context);
        return false;
      },
      child: DefaultLayout(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
           Text('LOGIN')
          ],
        ),
      ),
    );
  }

  Future<void> loginProc({required AuthTypeEnum authTypeEnum}) async {
    String uid = "";
    try {
      switch (authTypeEnum) {
        case AuthTypeEnum.KAKAO:
          uid = await KakaoAuthService().reqKakaoLogin();
        case AuthTypeEnum.FACEBOOK:
          uid = await FacebookAuthService().signInWithFacebook();
        case AuthTypeEnum.GOOGLE:
          uid = await GoogleAuthService().signWithGoogle();
        case AuthTypeEnum.APPLE:
          uid = await AppleAuthService().signInWithApple();
      }
    } catch (e) {
      uid = "";
    }

    if (uid.isNotEmpty) {
      log("LOGIN 성공 :: ${authTypeEnum.name} > $uid");

      UserModel? userModel = await AuthRepository().findUser(uid: uid);

      if(userModel == null){
        /// 유저 생성 해줘야함.
        await AuthRepository().createUser(uid: uid);
        userModel = await AuthRepository().findUser(uid: uid);
      }else{
        String fcmToken = await CustomFcm().getFCMToken();
        AuthRepository().updateUserFcmToken(uid: uid, fcmToken: fcmToken);
      }

      ref.read(authProvider.notifier).doLogin();
      CustomPrefs().setString(CustomPrefsKey.UID, uid);

    } else {
      CustomSnackbar.warnSnackbar(context: context, msg: "로그인에 실패했습니다.");
    }
  }
}
