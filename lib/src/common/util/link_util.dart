import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

class LinkUtil {
  static void openUrl({required String url, required BuildContext context}) {
    try {
      launchUrlString(url, mode: LaunchMode.externalApplication).onError((error, stackTrace) {
        return launchUrlString(
          url,
        ).onError((error, stackTrace) {
          return false;
        });
      });
    } catch (e) {}
  }
}
