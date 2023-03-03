import 'package:flutter/material.dart';
import 'package:toprate/consts/colors.dart';
import 'package:toprate/consts/theme_data.dart';
import 'package:toprate/widget/text_widget.dart';

class AuthButton extends StatelessWidget {
  AuthButton({
    Key? key,
    required this.fct,
    required this.buttonText,
    this.primary = Colors.white38,
    this.textStyle,
  }) : super(key: key);
  final Function fct;
  final String buttonText;
  final Color primary;
  TextStyle? textStyle;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: Color.fromARGB(255, 253, 123, 17)
              // background (button) color
              ),
          onPressed: () {
            fct();
            // _submitFormOnLogin();
          },
          child: TextWidget(
            text: buttonText,
            textSize: 20,
            color: Colors.white,
          )),
    );
  }
}
