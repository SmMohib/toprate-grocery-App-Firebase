// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:iconly/iconly.dart';
import 'package:provider/provider.dart';
import 'package:toprate/consts/colors.dart';
import 'package:toprate/model/categoriesModel.dart';
import 'package:toprate/provider/dark_theme_provider.dart';
import 'package:toprate/services/utils.dart';
import 'package:toprate/widget/auth_button.dart';
import 'package:toprate/widget/text_widget.dart';

class CardScreen extends StatefulWidget {
  static const routeName = '/cardScreen';
  CardScreen({super.key});

  @override
  State<CardScreen> createState() => _CardScreenState();
}

class _CardScreenState extends State<CardScreen> {
  int i = 1;

  @override
  Widget build(BuildContext context) {
    final themeState = Provider.of<DarkThemeProvider>(context);
    Size size = Utils(context).sizeScreen;

    bool isEmpty = false;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: themeState.getDarkTheme
              ? Color.fromRGBO(250, 100, 100, 0.984)
              : Color.fromARGB(255, 236, 164, 70),
          title: TextWidget(text: 'Card (3)', textSize: 20),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child:
                  IconButton(onPressed: () {}, icon: Icon(IconlyLight.delete)),
            )
          ],
        ),
        body: Column(
          children: [
            Material(
              color: themeState.getDarkTheme ? light : dark,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                      ),
                      onPressed: () {},
                      child: Container(
                          height: 40,
                          width: 100,
                          child: Center(
                              child: TextWidget(text: 'Oder', textSize: 20)))),
                  TextWidget(
                    text: 'Total Tk (230)',
                    textSize: 20,
                    fontWeight: FontWeight.w700,
                    isTitle: true,
                  )
                ],
              ),
            ),
            Expanded(
              child: isEmpty
                  ? Center(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset(
                              'images/box.png',
                              height: size.height * 0.44,
                              width: size.width * 0.44,
                            ),
                          ),
                          TextWidget(
                              text: 'No Products Found',
                              textSize: 30,
                              fontWeight: FontWeight.w600,
                              isTitle: true),
                        ],
                      ),
                    )
                  : ListView.builder(
                      itemCount: categorylist.length,
                      itemBuilder: (context, index) {
                        return Expanded(
                          flex: 2,
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Image.asset(
                                    '${categorylist[index].img}',
                                    height: size.height * 0.16,
                                    width: size.width * 0.24,
                                    fit: BoxFit.fill,
                                  ),
                                  Expanded(
                                    flex: 8,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        TextWidget(
                                          text: 'Fruit banana',
                                          textSize: 24,
                                          isTitle: true,
                                        ),
                                        const SizedBox(
                                          width: 10,
                                          height: 15,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                quantityControl(
                                                    colors: Colors.pink,
                                                    fct: () {
                                                      setState(() {
                                                        if (i > 1) {
                                                          --i;
                                                        }
                                                      });
                                                    },
                                                    icon: Icons.remove,
                                                    color: Colors.white),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(4.0),
                                                  child: TextWidget(
                                                    text: '${i}',
                                                    textSize: 22,
                                                    isTitle: true,
                                                  ),
                                                ),
                                                quantityControl(
                                                    colors: Colors.pink,
                                                    fct: () {
                                                      setState(() {
                                                        i++;
                                                      });
                                                    },
                                                    icon: Icons.add,
                                                    color: Colors.white),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                      flex: 3,
                                      child: Column(
                                        children: [
                                          IconButton(
                                            onPressed: () {},
                                            icon: Icon(IconlyLight.heart),
                                          ),
                                          TextWidget(
                                              text:
                                                  '\৳${categorylist[index].price}',
                                              textStyle: TextStyle(
                                                  decoration:
                                                      TextDecoration.overline),
                                              textSize: 20,
                                              fontWeight: FontWeight.w700,
                                              isTitle: true),
                                        ],
                                      )),
                                ],
                              ),
                              Divider(
                                thickness: 1,
                                // color: Color.fromARGB(31, 24, 23, 23),
                              )
                            ],
                          ),
                        );
                      },
                    ),
            ),
          ],
        ));
  }

  Widget quantityControl(
      {required Function fct,
      required IconData icon,
      required Color color,
      colors}) {
    return Material(
      color: colors,
      borderRadius: BorderRadius.circular(12),
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
    );
  }
}
//  TextWidget(
//                                               text:
//                                                   '${(categorylist[index].price)}',
//                                               textSize: 24,
//                                               color: Colors.green,
//                                               isTitle: true,
//                                             ),
//                                             // TextWidget(
//                                             //   text:
//                                             //       '${((40 * i) - 25 / 100 * 40)}',
//                                             //   textSize: 24,
//                                             //   color: Colors.green,
//                                             //   isTitle: true,
//                                             // ),
//                                             SizedBox(
//                                               width: 10,
//                                             ),
//                                             //25% add
//                                             Text(
//                                               '${((25 / 100 * 40) * i)}',
//                                               style: TextStyle(
//                                                   fontSize: 15,
//                                                   decoration: TextDecoration
//                                                       .lineThrough),
//                                             ),