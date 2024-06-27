import 'dart:developer';

import 'package:code_sliver/src/common/config/env/env.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:code_sliver/src/common/config/device/device_info.dart';
import 'package:code_sliver/src/common/config/env/env.dart';
import 'package:code_sliver/src/common/firebase/firebase_db.dart';
import 'package:code_sliver/src/common/http/custom_dio.dart';
import 'package:code_sliver/src/common/prefs/impl/custom_prefs.dart';
import 'package:code_sliver/src/model/enum/env_enum.dart';
import 'package:code_sliver/src/views/common/root_view.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';

void main() async {
  /// Env 초기화
  String env = await Env.initialEnv();

  await CustomPrefs().init(); // Prefs 초기화

  /// DeviceInfo 초기화
  DeviceInfo deviceInfo = DeviceInfo();
  await deviceInfo.initDeviceInfo();

  CustomDio().init(); // Http 초기화
  log('ENV INFO :: $env');
  log('DEVICE INFO :: ${deviceInfo.toJson().toString()}');

  /// FireBase Initialized
  await Firebase.initializeApp();
  FirebaseDb();

  /// App Initialized
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then(
    (_) {
      runApp(
        const ProviderScope(
          child: RootView(),
        ),
      );
    },
  );
}
