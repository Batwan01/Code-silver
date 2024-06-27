import 'dart:developer';
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:code_sliver/src/model/enum/device_type_enum.dart';

class DeviceInfo {
  static final DeviceInfo _instance = DeviceInfo._internal();

  factory DeviceInfo() {
    return _instance;
  }

  DeviceInfo._internal() {
    log("Singleton Instance Created <DeviceInfo>");
    initDeviceInfo();
  }

  late DeviceType deviceType;
  String deviceModelName = "";

  ///
  /// 앱 런칭시 기기정보를 초기화 해주는 매서드
  Future<void> initDeviceInfo() async {
    DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();

    if (Platform.isIOS) {
      IosDeviceInfo info = await deviceInfoPlugin.iosInfo;

      deviceType = DeviceType.IOS;
      deviceModelName = info.model;
    } else if (Platform.isAndroid) {
      AndroidDeviceInfo info = await deviceInfoPlugin.androidInfo;

      deviceType = DeviceType.AOS;
      deviceModelName = info.model;
    } else if (Platform.isWindows) {
      deviceType = DeviceType.WINDOW;
    } else if (Platform.isMacOS) {
      deviceType = DeviceType.MAC_OS;
    } else {
      deviceType = DeviceType.WEB;
    }
  }

  bool isIos() {
    return deviceType == DeviceType.IOS;
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> jsonMap = {
      "deviceType": deviceType.name,
      "deviceModelName": deviceModelName,
    };
    return jsonMap;
  }
}
