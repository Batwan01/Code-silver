import 'dart:convert';
import 'dart:developer';
import 'dart:ui';

import 'package:flutter/services.dart';

class LanguageConfig{
  static final LanguageConfig _instance = LanguageConfig._internal();

  factory LanguageConfig() {
    return _instance;
  }

  LanguageConfig._internal() {
    log("Singleton Instance Created <LanguageConfig>");
  }

  Map<String, dynamic> languageMap = {};

  Future<void> setLanguage ({required Locale locale}) async {
    final jsonString = await rootBundle.loadString('assets/language/${locale.languageCode}.json');
    final jsonMap = json.decode(jsonString) as Map<String, dynamic>;
    languageMap = jsonMap;
  }



}