// ignore_for_file: prefer_const_constructors

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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          itemCount: 10,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            mainAxisExtent: 170,
            childAspectRatio: 2,
          ),
          itemBuilder: (BuildContext context, int index) {
            return Category_widget();
          },
        ),
      ),
    );
  }
}
