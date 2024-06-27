abstract class PrefsInterface {
  Object? get(Enum key);
  bool? getBool(Enum key);
  int? getInt(Enum key);
  double? getDouble(Enum key);
  String? getString(Enum key);
  bool containsKey(Enum key);

  Future<bool> setBool(Enum key, bool value);
  Future<bool> setInt(Enum key, int value);
  Future<bool> setDouble(Enum key, double value);
  Future<bool> setString(Enum key, String value);
  Future<bool> setStringList(Enum key, List<String> value);

  Future<bool> remove(Enum key);
}
