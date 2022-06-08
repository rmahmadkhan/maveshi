import 'dart:convert';

import 'package:maveshi/all_utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Prefs {
  Prefs._prefsStorage();
  static final Prefs _instance = Prefs._prefsStorage();

  static Prefs get instance => _instance;

  factory Prefs() {
    return _instance;
  }

  static late SharedPreferences _prefs;

  static const String _keyUser = 'user';

  Future<void> init() async => _prefs = await SharedPreferences.getInstance();

  Future<bool> setUser(LocalUser user) =>
      _prefs.setString(_keyUser, jsonEncode(user.toJson()));

  LocalUser? get user {
    final userString = _prefs.getString(_keyUser);
    if (userString != null) {
      final userJson = jsonDecode(userString);
      return LocalUser.fromJson(userJson);
    }
    return null;
  }

  Future<bool> removeUser() => _prefs.remove(_keyUser);
}
