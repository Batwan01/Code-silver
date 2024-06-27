// ignore_for_file: non_constant_identifier_names, constant_identifier_names

import 'dart:developer';

import 'package:flutter/material.dart';

class CustomTypo {
  static final CustomTypo _instance = CustomTypo._internal();

  factory CustomTypo() {
    return _instance;
  }

  CustomTypo._internal() {
    log("Singleton Instance Created <CustomTypo>");
  }

  static const String fontFamily = "GmarketSans";

  ///
  /// H1
  static TextStyle H1_B = const TextStyle(
    fontFamily: fontFamily,
    fontSize: 24.0,
    fontWeight: FontWeight.w700, // Bold
    letterSpacing: -0.75,
    height: 30.0 / (24.0),
  );

  static TextStyle H1 = const TextStyle(
    fontFamily: fontFamily,
    fontSize: 24.0,
    fontWeight: FontWeight.w500, // Regular
    letterSpacing: -0.75,
    height: 30.0 / (24.0),
  );

  ///
  /// H2
  static TextStyle H2_B = const TextStyle(
    fontFamily: fontFamily,
    fontSize: 18.0,
    fontWeight: FontWeight.w700, // Bold
    letterSpacing: -0.75,
    height: 24.0 / (18.0),
  );

  static TextStyle H2 = const TextStyle(
    fontFamily: fontFamily,
    fontSize: 18.0,
    fontWeight: FontWeight.w500, // Regular
    letterSpacing: -0.75,
    height: 24.0 / (18.0),
  );

  ///
  /// H3
  static TextStyle H3_B = const TextStyle(
    fontFamily: fontFamily,
    fontSize: 16.0,
    fontWeight: FontWeight.w700, // Bold
    letterSpacing: -0.75,
    height: 24.0 / (16.0),
  );

  static TextStyle H3 = const TextStyle(
    fontFamily: fontFamily,
    fontSize: 16.0,
    fontWeight: FontWeight.w500, // Regular
    letterSpacing: -0.75,
    height: 24.0 / (16.0),
  );

  ///
  /// BODY1
  static TextStyle BODY1_B = const TextStyle(
    fontFamily: fontFamily,
    fontSize: 14.0,
    fontWeight: FontWeight.w700, // Bold
    letterSpacing: -0.75,
    height: 20.0 / (14.0),
  );

  static TextStyle BODY1 = const TextStyle(
    fontFamily: fontFamily,
    fontSize: 14.0,
    fontWeight: FontWeight.w500, // Regular
    letterSpacing: -0.75,
    height: 20.0 / (14.0),
  );

  static TextStyle BODY1_T = const TextStyle(
    fontFamily: fontFamily,
    fontSize: 14.0,
    fontWeight: FontWeight.w300, // Thin
    letterSpacing: -0.75,
    height: 20.0 / (14.0),
  );

  ///
  /// BODY2
  static TextStyle BODY2_B = const TextStyle(
    fontFamily: fontFamily,
    fontSize: 12.0,
    fontWeight: FontWeight.w700, // Bold
    letterSpacing: 0,
    height: 16.0 / (12.0),
  );

  static TextStyle BODY2 = const TextStyle(
    fontFamily: fontFamily,
    fontSize: 12.0,
    fontWeight: FontWeight.w500, // Regular
    letterSpacing: 0,
    height: 16.0 / (12.0),
  );

  static TextStyle BODY2_T = const TextStyle(
    fontFamily: fontFamily,
    fontSize: 12.0,
    fontWeight: FontWeight.w300, // Thin
    letterSpacing: 0,
    height: 16.0 / (12.0),
  );

  ///
  /// BODY3
  static TextStyle BODY3_B = const TextStyle(
    fontFamily: fontFamily,
    fontSize: 10.0,
    fontWeight: FontWeight.w700, // Bold
    letterSpacing: 0,
    height: 14.0 / (10.0),
  );

  static TextStyle BODY3 = const TextStyle(
    fontFamily: fontFamily,
    fontSize: 10.0,
    fontWeight: FontWeight.w500, // Regular
    letterSpacing: 0,
    height: 14.0 / (10.0),
  );

  static TextStyle BODY3_T = const TextStyle(
    fontFamily: fontFamily,
    fontSize: 10.0,
    fontWeight: FontWeight.w300, // Thin
    letterSpacing: 0,
    height: 14.0 / (10.0),
  );

  ///
  /// @ Param [TextStyle textStyle, Color? color]
  /// getter 느낌
  static TextStyle getTypo({
    required FontType fontType,
    Color color = Colors.black,
    TextDecoration? decoration,
    double? overrideSize,
    FontWeight? overrideWeight,
    double? overrideLetterSpacing,
    double? overrideLineheight,
  }) {
    TextStyle textStyle = typeBranch(fontType: fontType);

    return textStyle.copyWith(
        color: color,
        decoration: decoration,
        fontSize: overrideSize,
        fontWeight: overrideWeight,
        letterSpacing: overrideLetterSpacing,
        height: overrideLineheight);
  }

  ///
  /// @ Param [TextStyle textStyle]
  /// 숫자에 한해서 Letter Spacing 0.0 처리
  static TextStyle isNumber({required FontType fontType, Color color = Colors.black}) {
    TextStyle textStyle = typeBranch(fontType: fontType);
    return textStyle.copyWith(letterSpacing: 0, color: color);
  }

  /// @ Param [FontType fontType]
  /// fontType 에 해당하는 TextStyle 분기 로직
  static TextStyle typeBranch({required FontType fontType}) {
    TextStyle branchType;

    switch (fontType) {
      case FontType.H1_B:
        branchType = H1_B;
        break;
      case FontType.H1:
        branchType = H1;
        break;
      case FontType.H2_B:
        branchType = H2_B;
        break;
      case FontType.H2:
        branchType = H2;
        break;
      case FontType.H3_B:
        branchType = H3_B;
        break;
      case FontType.H3:
        branchType = H3;
        break;
      case FontType.BODY1_B:
        branchType = BODY1_B;
        break;
      case FontType.BODY1:
        branchType = BODY1;
        break;
      case FontType.BODY1_T:
        branchType = BODY1_T;
        break;
      case FontType.BODY2_B:
        branchType = BODY2_B;
        break;
      case FontType.BODY2:
        branchType = BODY2;
        break;
      case FontType.BODY2_T:
        branchType = BODY2_T;
        break;
      case FontType.BODY3_B:
        branchType = BODY3_B;
        break;
      case FontType.BODY3:
        branchType = BODY3;
        break;
      case FontType.BODY3_T:
        branchType = BODY3_T;
        break;
      default:
        branchType = BODY1;
    }
    return branchType;
  }
}

enum FontType {
  H1_B,
  H1,
  H2_B,
  H2,
  H3_B,
  H3,
  BODY1_B,
  BODY1,
  BODY1_T,
  BODY2_B,
  BODY2,
  BODY2_T,
  BODY3_B,
  BODY3,
  BODY3_T,
  SUB1_B,
  SUB1,
  SUB1_T,
}