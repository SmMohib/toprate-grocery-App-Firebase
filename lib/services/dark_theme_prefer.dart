import 'package:shared_preferences/shared_preferences.dart';

class DarkThemePrefer {
  static const Theme_status = 'THEMESTATUS';

  get getDarkTheme => null;
  setDarkTheme(bool value) async {
    SharedPreferences sharePreferences = await SharedPreferences.getInstance();
    sharePreferences.setBool(Theme_status, value);
  }

  Future<bool> getTheme() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getBool(Theme_status) ?? false;
  }
}
