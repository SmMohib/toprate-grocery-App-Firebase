// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:iconly/iconly.dart';
import 'package:toprate/screens/card.dart';
import 'package:toprate/services/utils.dart';
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
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: Column(children: [
          SizedBox(
            height: 20,
          ),
          Flexible(
            flex: 4,
            child: Image.asset(
              'images/cat/Spinach.png',
              width: size.height * 0.33,
            ),
          ),
          SizedBox(
            height: 180,
          ),
          Flexible(
            flex: 7,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.black54,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 20, left: 30, right: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: TextWidget(
                            text: 'title',
                            textSize: 25,
                            isTitle: true,
                          ),
                        ),
                        Flexible(child: Icon(IconlyLight.heart)),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 20, left: 30, right: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        TextWidget(
                          text: '\$2.77',
                          color: Colors.green,
                          textSize: 22,
                          isTitle: true,
                        ),
                        TextWidget(
                          text: '/Piece',
                          textSize: 12,
                          isTitle: false,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Visibility(
                          //  visible: getCurrProduct.isOnSale ? true : false,
                          child: Text(
                            '\$4.5',
                            style: TextStyle(
                                fontSize: 15,
                                decoration: TextDecoration.lineThrough),
                          ),
                        ),
                        const Spacer(),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 4, horizontal: 8),
                          decoration: BoxDecoration(
                              color: const Color.fromRGBO(63, 200, 101, 1),
                              borderRadius: BorderRadius.circular(5)),
                          child: TextWidget(
                            text: 'Free delivery',
                            color: Colors.white,
                            textSize: 20,
                            isTitle: true,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      quantityControl(
                        fct: () {
                          setState(() {
                            if (i > 1) {
                              i--;
                            }
                          });
                        },
                        icon: Icons.remove,
                        color: Colors.red,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Flexible(
                          flex: 1,
                          child: TextWidget(
                            text: '${i}',
                            textSize: 22,
                          )),
                      const SizedBox(
                        width: 5,
                      ),
                      quantityControl(
                        fct: () {
                          setState(() {
                            i++;
                          });
                        },
                        icon: Icons.add,
                        color: Colors.green,
                      ),
                    ],
                  ),
                  const Spacer(),
                ],
              ),
            ),
          )
        ]),
        bottomNavigationBar: Container(
          height: 110,
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondary,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextWidget(
                      text: 'Total',
                      color: Colors.red.shade300,
                      textSize: 22,
                      isTitle: true,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    FittedBox(
                      child: Row(
                        children: [
                          TextWidget(
                            text: '\$4.3/',
                            color: Color.fromARGB(255, 255, 255, 255),
                            textSize: 20,
                            isTitle: true,
                          ),
                          TextWidget(
                            text: 'Kg',
                            color: Colors.red.shade300,
                            textSize: 16,
                            isTitle: false,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              //add to cart
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, CardScreen.routeName);
                },
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 9),
                  decoration: BoxDecoration(
                      color: const Color.fromRGBO(63, 200, 101, 1),
                      borderRadius: BorderRadius.circular(5)),
                  child: TextWidget(
                    text: 'Add to cart',
                    color: Colors.white,
                    textSize: 20,
                    isTitle: true,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget quantityControl(
      {required Function fct, required IconData icon, required Color color}) {
    return Flexible(
      flex: 2,
      child: Material(
        borderRadius: BorderRadius.circular(12),
        color: color,
        child: InkWell(
            borderRadius: BorderRadius.circular(12),
            onTap: () {
              fct();
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                icon,
                color: Colors.white,
                size: 25,
              ),
            )),
      ),
    );
  }
}
