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
import 'package:toprate/widget/feed_items.dart';
import 'package:toprate/widget/item_widget.dart';
import 'package:toprate/widget/text_widget.dart';

class OnSaleScreen extends StatefulWidget {
  static const routeName = "/onsaleScreen";
  const OnSaleScreen({super.key});

  @override
  State<OnSaleScreen> createState() => _OnSaleScreenState();
}

class _OnSaleScreenState extends State<OnSaleScreen> {
  int i = 1;
  @override
  Widget build(BuildContext context) {
    final themeState = Provider.of<DarkThemeProvider>(context);
    Size size = Utils(context).sizeScreen;

    bool isEmpty = false;
    return Scaffold(
        appBar: AppBar(
          title: TextWidget(text: 'Products On Sale', textSize: 20),
        ),
        body: isEmpty
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
                  return Card(
                    color: themeState.getDarkTheme
                        ? Color.fromRGBO(226, 236, 247, 0.973)
                        : Color.fromARGB(66, 241, 212, 212),
                    child: Expanded(
                      flex: 2,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Image.asset(
                            '${categorylist[index].img}',
                            height: size.height * 0.14,
                            width: size.width * 0.24,
                            fit: BoxFit.fill,
                          ),
                          Expanded(
                            flex: 8,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: 10,
                                  height: 5,
                                ),
                                Row(
                                  children: [
                                    TextWidget(
                                        text:
                                            'Sale Price: ${categorylist[index].price}',
                                        textStyle: TextStyle(
                                            decoration:
                                                TextDecoration.overline),
                                        textSize: 16,
                                        fontWeight: FontWeight.w700,
                                        isTitle: true),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    TextWidget(
                                      text:
                                          '(${categorylist[index].offerpercen}% OFF)',
                                      textSize: 14,
                                      color: Colors.red,
                                    ),
                                    const SizedBox(width: 10),
                                    IconButton(
                                        onPressed: () {},
                                        icon: Icon(IconlyLight.heart))
                                  ],
                                ),
                                const SizedBox(width: 4),
                                //price % add
                                Row(
                                  children: [
                                    TextWidget(
                                        text: 'TK',
                                        textSize: 18,
                                        fontWeight: FontWeight.w700,
                                        isTitle: true),
                                    const SizedBox(width: 4),

                                    TextWidget(
                                      text: '${((40 * i) - 25 / 100 * 40)}',
                                      textSize: 24,
                                      color: Colors.green,
                                      isTitle: true,
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    //25% add
                                    Text(
                                      '${((25 / 100 * 40) * i)}',
                                      style: TextStyle(
                                          fontSize: 15,
                                          decoration:
                                              TextDecoration.lineThrough),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
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
                                          radius: 14,
                                          child: Icon(
                                            Icons.remove,
                                            size: 15,
                                          ),
                                        )),
                                    const SizedBox(width: 5),
                                    TextWidget(
                                      text: ("${i} KG"),
                                      textSize: 18,
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
                                          radius: 14,
                                          child: Icon(
                                            Icons.add,
                                            size: 15,
                                          ),
                                        )),
                                  ],
                                ),

                                TextWidget(
                                  text: 'Fruit is Favorate',
                                  textSize: 20,
                                  isTitle: true,
                                ),
                                SizedBox(
                                  height: 5,
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ));
  }
}
//  Row(
//                                       children: [
//                                         IconButton(
//                                             onPressed: () {},
//                                             icon: Icon(IconlyLight.bag)),
//                                         IconButton(
//                                             onPressed: () {},
//                                             icon: Icon(IconlyLight.heart))
//                                       ],
//                                     ),
//                                     const SizedBox(height: 5),
//                                     Row(
//                                       children: [
//                                         TextWidget(
//                                           text: '200',
//                                           textSize: 26,
//                                           color: Colors.green,
//                                           isTitle: true,
//                                         ),
//                                         SizedBox(
//                                           width: 10,
//                                         ),
//                                         Text(
//                                           "100",
//                                           style: TextStyle(
//                                               fontSize: 18,
//                                               decoration:
//                                                   TextDecoration.lineThrough),
//                                         )
//                                       ],
//                                     ),