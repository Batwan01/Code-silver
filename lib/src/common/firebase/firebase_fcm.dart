
import 'dart:convert';
import 'dart:developer';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:go_router/go_router.dart';

class CustomFcm {
  static final CustomFcm _instance = CustomFcm._internal();

  factory CustomFcm() {
    return _instance;
  }

  /// Instance of [FirebaseMessaging]
  late FirebaseMessaging messaging;

  /// Stream of background message when app is opened
  late Stream<RemoteMessage> openedApp;

  /// Stream of foreground message
  late Stream<RemoteMessage> onForeground;

  late NotificationSettings notificationSettings;

  String? token;

  CustomFcm._internal() {
    initialize();
    log('Singleton Instance Created <CustomFcm>');
  }

  ///
  /// Dgdr FCM Initialize
  Future<void> initialize() async {
    messaging = FirebaseMessaging.instance;
    openedApp = FirebaseMessaging.onMessageOpenedApp;
    onForeground = FirebaseMessaging.onMessage;

    token = await messaging.getToken();
    log("FCM TOKEN GET :: $token");

    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
    FirebaseMessaging.onMessage.listen(_firebaseMessagingFogroundHandler);
  }

  ///
  /// 알림 허용 권한 요청
  Future<void> requestNotificationPermission() async {
    notificationSettings = await messaging.requestPermission();

    Map<String, dynamic> notificationSettingJson = {
      'alert': notificationSettings.alert.name,
      'badge': notificationSettings.badge.name,
      'sound': notificationSettings.sound.name,
    };
    log("FCM PERMISSION :: ${notificationSettingJson.toString()}");
  }

  ///
  /// Background 수신 핸들러
  static Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
    log("FCM BackgroundMessage :: ${jsonEncode(message.toMap())}");
  }

  ///
  /// Foground 수신 핸들러
  static Future<void> _firebaseMessagingFogroundHandler(RemoteMessage message) async {
    log("FCM FogroundMessage :: ${jsonEncode(message.toMap())}");
  }

  ///
  /// Fcm app open Handler
  static Future<void> firebaseMessagingBackgroundClickHandler({
    required GoRouter goRouter,
    required RemoteMessage message,
  }) async {
    log( "FCM Open Handler ::  ${jsonEncode(message.toMap())} ");

    String fcmKindStr = message.data['fcmDataKind'] ?? "";
    if (fcmKindStr == "") return;


  }

  ///
  /// Fcm Token Getter
  Future<String> getFCMToken() async {
    String? _fcmToken = token;

    if (_fcmToken == null) {
      token = await FirebaseMessaging.instance.getToken();
      _fcmToken = token;
    }
    return _fcmToken!;
  }
}
