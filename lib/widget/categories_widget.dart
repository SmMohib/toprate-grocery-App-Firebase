// ignore_for_file: sized_box_for_whitespace, sort_child_properties_last, unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';
import 'package:toprate/consts/colors.dart';
import 'package:toprate/model/categoriesModel.dart';
import 'package:toprate/provider/dark_theme_provider.dart';
import 'package:toprate/widget/text_widget.dart';

class Category_widget extends StatelessWidget {
  Category_widget({super.key,this.name,this.price,this.imagelist});
String? name, img, price;
  List<String> ? imagelist;
  @override
  Widget build(BuildContext context) {
    final themeState = Provider.of<DarkThemeProvider>(context);
    final color = themeState.getDarkTheme ? btColor : dark;
    double __width = MediaQuery.of(context).size.width;
    double __height = MediaQuery.of(context).size.height;
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: secondary),
           color: primary.withOpacity(0.1)),
      child: Column(children: [
        Container(
          child: Image.asset(
            img!,
          ),
          height: 100,
          width: 200,
        ),
        Text(name!)
      ]),
    );
  }
}
