// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, sort_child_properties_last

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:toprate/consts/colors.dart';
import 'package:toprate/consts/text_style.dart';
import 'package:toprate/model/categoriesModel.dart';
import 'package:toprate/widget/categories_widget.dart';
import 'package:toprate/widget/feed_items.dart';
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
        child:  GridView.count(
        crossAxisCount: 2,
        shrinkWrap: true,
        children: List.generate(5, (index) {
          return Feed_Items();
        }),
      ),
      ),
    );
  }
}
