import 'package:shared_preferences/shared_preferences.dart';

class PreferenceHandlerNama {
  //Inisialisasi Shared Preference
  static final PreferenceHandlerNama _instance = PreferenceHandlerNama._internal();
  late SharedPreferences _preferences;
  factory PreferenceHandlerNama() => _instance;
  PreferenceHandlerNama._internal();
  Future<void> init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  //Key user
  static const String _isNama = 'isNama';

  //CREATE
  Future<void> storingIsLogin(bool isLogin) async {
    // final prefs = await SharedPreferences.getInstance();
    _preferences.setBool(_isNama, isLogin);
  }

  //GET
  static Future<bool?> getIsLogin() async {
    final prefs = await SharedPreferences.getInstance();

    var data = prefs.getBool(_isNama);
    return data;
  }

  //DELETE
  Future<void> deleteIsLogin() async {
    await _preferences.remove(_isNama);
  }
}