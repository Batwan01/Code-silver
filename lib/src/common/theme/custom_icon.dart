// ignore_for_file: deprecated_member_use

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomIcon {
  static final CustomIcon _instance = CustomIcon._internal();

  factory CustomIcon() {
    return _instance;
  }

  CustomIcon._internal() {
    log("Singleton Instance Created <CustomIcon>");
  }

  static String iconHome = 'assets/imgs/icon_home.svg';
  static String iconChat = 'assets/imgs/icon_chat.svg';
  static String iconJob = 'assets/imgs/icon_job.svg';
  static String iconProfile = 'assets/imgs/icon_profile.svg';

  ///
  /// Icon Getter
  static Transform get({required String path, Color? color, double scale = 1.0, BoxFit fit = BoxFit.contain}) {
    SvgPicture svgPicture = SvgPicture.asset(
      path,
      color: color,
      fit: fit,
    );
    return Transform.scale(
      scale: scale,
      child: svgPicture,
    );
  }

  static Widget getPng({required String path, Color? color, double scale = 1.0, BoxFit fit = BoxFit.contain}) {
    return Image.asset(
      path,
      fit: fit,
    );
  }
}
