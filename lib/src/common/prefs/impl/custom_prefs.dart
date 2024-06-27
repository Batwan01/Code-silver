import 'dart:developer';

import 'package:code_sliver/src/common/prefs/prefs_interface.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CustomPrefs implements PrefsInterface {
  static final CustomPrefs _instance = CustomPrefs._internal();

  factory CustomPrefs() {
    return _instance;
  }

  CustomPrefs._internal() {
    init();
    log("Singleton Instance Created <CustomPrefs>");
  }

  late SharedPreferences sharedPreferences;

  Future<void> init() async {
    sharedPreferences = await SharedPreferences.getInstance();

    Set<String> keys = sharedPreferences.getKeys();
    log("CustomPrefs Datas... ${keys.length} 개");
    for (var key in keys) {
      log("CustomPrefs $key  ::  ${sharedPreferences.get(key)}");
    }
  }

  @override
  bool containsKey(Enum key) {
    log("containsKey(${key.name})");
    return sharedPreferences.containsKey(key.name);
  }

  @override
  Object? get(Enum key) {
    log("getObject(${key.name})");
    return sharedPreferences.get(key.name);
  }

  Future<void> reload() async {
    await sharedPreferences.reload();
  }

  @override
  bool? getBool(Enum key) {
    log(
      "getBool(${key.name})",
    );
    return sharedPreferences.getBool(key.name);
  }

  @override
  double? getDouble(Enum key) {
    log("getDouble(${key.name})");
    return sharedPreferences.getDouble(key.name);
  }

  @override
  int? getInt(Enum key) {
    log("getInt(${key.name})");
    return sharedPreferences.getInt(key.name);
  }

  @override
  String? getString(Enum key) {
    log(
      "getString(${key.name})",
    );
    return sharedPreferences.getString(key.name);
  }

  @override
  Future<bool> remove(Enum key) {
    log(
      "remove(${key.name})",
    );
    return sharedPreferences.remove(key.name);
  }

  @override
  Future<bool> setBool(Enum key, bool value) async {
    sharedPreferences = await SharedPreferences.getInstance();
    log(
      "setBool(${key.name})",
    );
    return sharedPreferences.setBool(key.name, value);
  }

  @override
  Future<bool> setDouble(Enum key, double value) async {
    sharedPreferences = await SharedPreferences.getInstance();
    log(
      "setDouble(${key.name})",
    );
    return sharedPreferences.setDouble(key.name, value);
  }

  @override
  Future<bool> setInt(Enum key, int value) async {
    sharedPreferences = await SharedPreferences.getInstance();
    log(
      "setInt(${key.name})",
    );
    return sharedPreferences.setInt(key.name, value);
  }

  @override
  Future<bool> setString(Enum key, String value) async {
    sharedPreferences = await SharedPreferences.getInstance();
    log(
      "setString(${key.name})",
    );
    return sharedPreferences.setString(key.name, value);
  }

  @override
  Future<bool> setStringList(Enum key, List<String> value) async {
    sharedPreferences = await SharedPreferences.getInstance();
    log(
      "setStringList(${key.name})",
    );
    return sharedPreferences.setStringList(key.name, value);
  }
}
