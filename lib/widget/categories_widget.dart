import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:toprate/consts/colors.dart';
import 'package:toprate/widget/text_widget.dart';

class Category_widget extends StatelessWidget {
  const Category_widget({super.key});

  @override
  Widget build(BuildContext context) {
    double __width = MediaQuery.of(context).size.width;
    double __height = MediaQuery.of(context).size.height;
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: secondary),
          color: primary.withOpacity(0.1)),
      child: Column(children: [
        Container(
          child: Image.asset('images/cat/fruits.png'),
          height: __height * 0.2,
          width: __width * 0.4,
        ),
        TextWidget(text: 'text', textSize: 22)
      ]),
    );
  }
}
