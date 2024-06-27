import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class Env {
  static Future<String> initialEnv() async {
    try {
      String env = kReleaseMode ? 'prod' : 'dev';
      String profile = const String.fromEnvironment(
          'env'); // lunch cmd에 옵션이 있었는지 확인 :: --dart-define env=dev

      if (profile != '') env = profile;

      await dotenv.load(fileName: "assets/env/$env.env");

      return env;
    } catch (e) {
      throw Exception("ENV 파일 오류 !! /assets/env 파일을 확인해주세요");
    }
  }
}
