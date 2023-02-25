import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:toprate/provider/dark_theme_provider.dart';
import 'package:toprate/services/dark_theme_prefer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final themeState = Provider.of<DarkThemeProvider>(context);
    return Scaffold(
      body: Column(
        children: [
          SwitchListTile(
            title: Text('Theme'),
            secondary: Icon(themeState.getDarkTheme
                ? Icons.dark_mode_outlined
                : Icons.light_mode_outlined),
            onChanged: (bool value) {
              setState(() {
                themeState.setDarkTheme = value;
              });
            },
            value: themeState.getDarkTheme,
          ),
          Image.asset(
            'images/warning-sign.png',
            height: 200,
            width: 200,
          ),
        ],
      ),
    );
  }
}
