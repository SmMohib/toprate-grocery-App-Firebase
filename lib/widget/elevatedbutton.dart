import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';
import 'package:toprate/services/utils.dart';
import 'package:toprate/widget/text_widget.dart';

import '../provider/dark_theme_provider.dart';

class ElevatedButtons extends StatelessWidget {
  ElevatedButtons({super.key, required this.onTap, required this.text});
  String text;
  Function onTap;

  @override
  Widget build(BuildContext context) {
    final themeState = Provider.of<DarkThemeProvider>(context);
    Size size = Utils(context).sizeScreen;
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor:
                themeState.getDarkTheme ? Colors.black : Colors.white),
        onPressed: () {
          onTap.toString();
        },
        child: Container(
            height: 40,
            width: double.infinity,
            child: Center(child: TextWidget(text: text, textSize: 20))));
  }
}
