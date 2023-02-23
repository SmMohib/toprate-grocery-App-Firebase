import 'package:flutter/material.dart';
import 'package:toprate/services/dark_theme_prefer.dart';

class DarkThemeProvider with ChangeNotifier {
  DarkThemePrefer darkThemePrefer = DarkThemePrefer();
  bool _darkTheme = false;
  bool get getDarkTheme => _darkTheme;

  set setDarkTheme(bool value) {
    _darkTheme = value;
    darkThemePrefer.setDarkTheme(value);
    notifyListeners();
  }
}
