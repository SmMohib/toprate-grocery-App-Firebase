// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:iconly/iconly.dart';
import 'package:toprate/services/utils.dart';
import 'package:toprate/widget/auth_button.dart';
import 'package:toprate/widget/elevatedbutton.dart';
import 'package:toprate/widget/text_widget.dart';

class ProductDetail extends StatefulWidget {
  static const routeName = 'productDetail';
  const ProductDetail({super.key});

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  int i = 1;
  @override
  Widget build(BuildContext context) {
    Size size = Utils(context).sizeScreen;
    final Color color = Utils(context).color;
    return Scaffold(
      appBar: AppBar(leading: Icon(IconlyLight.arrow_left_2)),
      body: Column(
        children: [
          Image.asset(
            'images/cat/veg.png',
            width: size.height,
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextWidget(
                  text: 'text',
                  textSize: 24,
                  fontWeight: FontWeight.w600,
                  isTitle: true,
                ),
                IconButton(onPressed: () {}, icon: Icon(IconlyLight.heart))
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Flexible(
                  flex: 3,
                  child: Row(
                    children: [
                      TextWidget(
                        text: '\$2.00',
                        textSize: 24,
                        fontWeight: FontWeight.w600,
                        isTitle: true,
                      ),
                      TextWidget(
                        text: '/Kg',
                        textSize: 20,
                        fontWeight: FontWeight.w600,
                        isTitle: true,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      TextWidget(
                        text: '25% Off',
                        textSize: 17,
                        color: Colors.red,
                        fontWeight: FontWeight.w600,
                        isTitle: true,
                      ),
                    ],
                  ),
                ),
                Flexible(
                    flex: 2,
                    child: ElevatedButtons(
                      text: 'Free Delivary',
                      onTap: () {},
                    ))
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                  onTap: () {
                    setState(() {
                      if (i > 1) {
                        i--;
                      }
                    });
                  },
                  child: CircleAvatar(
                    backgroundColor: Colors.pink,
                    radius: 24,
                    child: Icon(
                      Icons.remove,
                      size: 20,
                    ),
                  )),
              const SizedBox(width: 5),
              TextWidget(
                text: ("${i} Kg"),
                textSize: 22,
                isTitle: true,
              ),
              const SizedBox(width: 5),
              InkWell(
                  onTap: () {
                    setState(() {
                      i++;
                    });
                  },
                  child: CircleAvatar(
                    backgroundColor: Colors.pink,
                    radius: 24,
                    child: Icon(
                      Icons.add,
                      size: 20,
                    ),
                  )),
            ],
          ),
        ],
      ),
      bottomNavigationBar: Container(
        color: color,
        height: 80,
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                flex: 4,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextWidget(
                      text: 'Total Taka',
                      textSize: 24,
                      color: Colors.red,
                      isTitle: true,
                    ),
                    Row(
                      children: [
                        TextWidget(
                          text: '\$1.44',
                          textSize: 22,
                          isTitle: true,
                        ),
                        TextWidget(text: '(\$0.33 off)', textSize: 20),
                      ],
                    )
                  ],
                ),
              ),
              Flexible(
                  flex: 3,
                  child: ElevatedButtons(onTap: () {}, text: 'Add to cart'))
            ],
          ),
        ),
      ),
    );
  }
}
