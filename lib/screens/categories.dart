import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:toprate/consts/colors.dart';
import 'package:toprate/consts/text_style.dart';
import 'package:toprate/widget/categories_widget.dart';
import 'package:toprate/widget/text_widget.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double __width = MediaQuery.of(context).size.width;
    double __height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          // ignore: prefer_const_constructors

          GridView.count(
            childAspectRatio: 200 / 250,
            crossAxisSpacing: 5,
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            children: List.generate(10, (index) {
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
            }),
          )
        ],
      ),
    );
  }
}
