// ignore_for_file: prefer_const_constructors

import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:provider/provider.dart';
import 'package:toprate/provider/dark_theme_provider.dart';
import 'package:toprate/services/utils.dart';
import 'package:toprate/widget/auth_button.dart';
import 'package:toprate/widget/text_widget.dart';

class Feed_Items extends StatelessWidget {
  const Feed_Items({super.key});

  @override
  Widget build(BuildContext context) {
    final themeState = Provider.of<DarkThemeProvider>(context);
    Size size = Utils(context).sizeScreen;
    return InkWell(
      onTap: () {
        // GlobalMethods.navigateTo(
        //     ctx: context, routeName: ProductDetails.routeName);
      },
      borderRadius: BorderRadius.circular(12),
      child: Card(
        child: Column(children: [
          Image.asset(
            'images/cat/spices.png',
            height: size.width * 0.22,
            width: size.width * 0.3,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    flex: 3,
                    child: TextWidget(
                      text: 'Apple',
                      maxLines: 1,
                      textSize: 16,
                      isTitle: true,
                    ),
                  ),
                  Flexible(flex: 1, child: Icon(IconlyLight.heart))
                ]),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                flex: 3,
                child: Row(
                  children: [
                    TextWidget(
                      text: '200',
                      textSize: 20,
                      color: Colors.green,
                      isTitle: true,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "100",
                      style: TextStyle(
                          fontSize: 18, decoration: TextDecoration.lineThrough),
                    )
                  ],
                ),
              ),
              Flexible(
                child: Row(
                  children: [
                    Flexible(
                      flex: 6,
                      child: FittedBox(
                        child: TextWidget(
                          text: 'kg 1',
                          textSize: 20,
                          isTitle: true,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                  ],
                ),
              )
            ],
          ),
          SizedBox(
            height: 6,
          ),
          AuthButton(fct: () {}, buttonText: 'Add Card'),
        ]),
      ),
    );
  }
}
