import 'package:flutter/material.dart';
import 'package:toprate/consts/colors.dart';

class Style {
  static ThemeData themeData(
      bool isDarkTheme, BuildContext context, BuildContext) {
    return ThemeData(
      scaffoldBackgroundColor: isDarkTheme ? light : textColor,
      primaryColor: dark,
      colorScheme: ThemeData().colorScheme.copyWith(
            secondary: isDarkTheme ? light : dark,
            brightness: isDarkTheme ? Brightness.light : Brightness.dark,
          ),
      cardColor: isDarkTheme ? light : dark,
      canvasColor: isDarkTheme ? dark : light,

      // buttonBarTheme: Theme.of(context).buttonTheme.copyWith(
      //   colorScheme: isDarkTheme
      //   ?ColorScheme.dark( )
      //   :ColorScheme.light()
      // )
    );
  }
}
