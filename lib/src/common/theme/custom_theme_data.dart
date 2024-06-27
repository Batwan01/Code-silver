// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomThemeData {
  static const _lightFillColor = Color(0xFFFAF9FB);
  static const _darkFillColor = Color(0xFF262626);
  static const _primaryColor = Color(0xff5065ED);
  static const _primaryBlackColor = Color(0xFF333333);

  static final ThemeData light = ThemeData(
      useMaterial3: false,
      brightness: Brightness.light,
      colorSchemeSeed: _primaryColor,
      appBarTheme: AppBarTheme(
        backgroundColor: _lightFillColor,
        surfaceTintColor: Colors.transparent,
        iconTheme: const IconThemeData(color: _primaryBlackColor),
      ),
      scaffoldBackgroundColor: _lightFillColor,
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        selectedItemColor: _lightFillColor,
        unselectedItemColor: Colors.black,
      ),
      progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: _primaryColor,
      ),
      textSelectionTheme: const TextSelectionThemeData(
        cursorColor: _primaryColor,
      ),
      inputDecorationTheme: const InputDecorationTheme(
        enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Color(0xff909090), width: 1)),
        focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: _primaryColor, width: 1)),
      ),
      dividerTheme: const DividerThemeData(
        thickness: 1,
        color: Color(0xffEBEBEB),
      ),
      textTheme: _textTheme(_primaryBlackColor));
  static final ThemeData dark = ThemeData(
      useMaterial3: false,
      brightness: Brightness.dark,
      colorSchemeSeed: _primaryColor,
      dividerTheme: const DividerThemeData(thickness: 1, color: Color(0xff919191)),
      appBarTheme: AppBarTheme(
        systemOverlayStyle: const SystemUiOverlayStyle(statusBarColor: _lightFillColor, statusBarIconBrightness: Brightness.dark, statusBarBrightness: Brightness.dark),
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        titleTextStyle: GoogleFonts.interTextTheme().titleMedium!.copyWith(color: _lightFillColor, fontSize: 17),
        iconTheme: const IconThemeData(color: _lightFillColor),
      ),
      scaffoldBackgroundColor: _darkFillColor,
      progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: _primaryColor,
      ),
      textSelectionTheme: const TextSelectionThemeData(
        cursorColor: Colors.white,
      ),
      inputDecorationTheme: const InputDecorationTheme(
        enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white, width: 1)),
        focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: _primaryColor, width: 1)),
      ),
      textTheme: _textTheme(_lightFillColor));

  static const _regular = FontWeight.w400;
  static const _medium = FontWeight.w500;
  static const _semiBold = FontWeight.w600;
  static const _bold = FontWeight.w700;

  static TextTheme _textTheme(Color color) {
    return GoogleFonts.interTextTheme()
        .copyWith(
          bodyText1: GoogleFonts.inter(
            fontWeight: _regular,
            fontSize: 14.0,
          ),
          bodyText2: GoogleFonts.inter(
            fontWeight: _regular,
            fontSize: 16.0,
          ),
          headline4: GoogleFonts.inter(
            fontWeight: _bold,
            fontSize: 20.0,
          ),
          headline5: GoogleFonts.inter(
            fontWeight: _medium,
            fontSize: 16.0,
          ),
          headline6: GoogleFonts.inter(
            fontWeight: _bold,
            fontSize: 16.0,
          ),
          subtitle1: GoogleFonts.inter(
            fontWeight: _medium,
            fontSize: 16.0,
          ),
          subtitle2: GoogleFonts.inter(
            fontWeight: _medium,
            fontSize: 14.0,
          ),
          caption: GoogleFonts.inter(
            fontWeight: _semiBold,
            fontSize: 16.0,
          ),
          overline: GoogleFonts.inter(
            fontWeight: _medium,
            fontSize: 12.0,
          ),
          button: GoogleFonts.inter(
            fontWeight: _semiBold,
            fontSize: 14.0,
          ),
        )
        .apply(bodyColor: color);
  }
}
