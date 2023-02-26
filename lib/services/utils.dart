import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toprate/provider/dark_theme_provider.dart';

class Utils {
  BuildContext context;
  Utils(this.context);
  bool get getTheme => Provider.of<DarkThemeProvider>(context).getDarkTheme;
  Color get color => getTheme ? Colors.white : Colors.black;
  Size get sizeScreen => MediaQuery.of(context).size;
}
