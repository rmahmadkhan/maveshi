import 'dart:convert';

import 'package:maveshi/all_utils.dart';
import 'package:maveshi/models/farm.dart';
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
  static const String _keyFarm = 'farm';

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

  Future<bool> setFarm(Farm farm) =>
      _prefs.setString(_keyFarm, jsonEncode(farm.toJson()));

  Farm? get farm {
    final farmString = _prefs.getString(_keyFarm);
    if (farmString != null) {
      final json = jsonDecode(farmString);
      return Farm.fromJson(json);
    }
    return null;
  }

  Future<bool> removeFarm() => _prefs.remove(_keyFarm);
}
