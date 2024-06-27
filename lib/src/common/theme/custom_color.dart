// ignore_for_file: constant_identifier_names

import 'dart:developer';

import 'package:flutter/material.dart';

class CustomColor {
  static final CustomColor _instance = CustomColor._internal();

  factory CustomColor() {
    return _instance;
  }

  CustomColor._internal() {
    log(
      "Singleton Instance Created <CustomColor>",
    );
  }

  static Color kakao_yellow = const Color(0xffFAE300);
  static Color naver_green = const Color(0xff03CF5D);
  static Color google_gray = const Color(0xffF0F0F0);
  static Color facebook_blue = const Color(0xff1877F2);
  static Color sf_green = const Color(0xff64D07D);
  static Color sf_green_sub = const Color(0xffEFFDF1);
  static Color sf_green_sub2 = const Color(0xff18A445);
  static Color sf_green_sub3 = const Color(0xffd9f3e1);
  static Color sf_green_tilt = const Color(0xffAFDDDB);
  static Color sf_dark_green = const Color(0xff000C26);
  static Color sf_red = const Color(0xffDC3545);
  static Color sf_pink = const Color(0xffF4C2C2);
  static Color sf_pink2 = const Color(0xffFFA3A3);
  static Color sf_pink_sub = const Color(0xffFFF4F8);
  static Color sf_purple = const Color(0xff908EFE);
  static Color sf_purple_sub = const Color(0xffF6F6FF);
  static Color sf_gray = const Color(0xffABAFB7);
  static Color sf_gray_sub = const Color(0xff676d7d);
  static Color sf_gray_light = const Color(0xffF9F9F9);
  static Color sf_gray_dim = const Color(0xff000C26);
  static Color sf_white = const Color(0xffFFFFFF);
  static Color sf_cream = const Color(0xffF6F2E7);
  static Color sf_store_main = const Color(0xffFFFBF1);
  static Color sf_black = const Color(0xff000000);
  static Color sf_bg = const Color(0x662F3E39);

  static Color sf_100 = const Color(0xffFFFFFF);
  static Color sf_200 = const Color(0xffF8F8F8);
  static Color sf_300 = const Color(0xffF0F0F0);
  static Color sf_400 = const Color(0xffDFDFDF);
  static Color sf_500 = const Color(0xffC9C9C9);
  static Color sf_600 = const Color(0xffABABAB);
  static Color sf_700 = const Color(0xff797979);
  static Color sf_800 = const Color(0xff2F3E39);

  static MaterialColor createMaterialColor(Color color) {
    List strengths = <double>[.05];
    Map<int, Color> swatch = {};
    final int r = color.red, g = color.green, b = color.blue;

    for (int i = 1; i < 10; i++) {
      strengths.add(0.1 * i);
    }
    for (var strength in strengths) {
      final double ds = 0.5 - strength;
      swatch[(strength * 1000).round()] = Color.fromRGBO(
        r + ((ds < 0 ? r : (255 - r)) * ds).round(),
        g + ((ds < 0 ? g : (255 - g)) * ds).round(),
        b + ((ds < 0 ? b : (255 - b)) * ds).round(),
        1,
      );
    }
    return MaterialColor(color.value, swatch);
  }
}
