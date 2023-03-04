// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:iconly/iconly.dart';
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
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Card(
                    color: Color.fromARGB(255, 119, 91, 0),
                    child: Expanded(
                      flex: 2,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Image.asset(
                            'images/cat/Spinach.png',
                            height: size.height * 0.14,
                            width: size.width * 0.24,
                            fit: BoxFit.fill,
                          ),
                          Expanded(
                            flex: 8,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                //price % add
                                Row(
                                  children: [
                                    TextWidget(
                                        text: 'TK',
                                        textSize: 22,
                                        fontWeight: FontWeight.w700,
                                        isTitle: true),
                                    const SizedBox(width: 4),
                                    TextWidget(
                                      text: '${((40 * i) - 25 / 100 * 40)}',
                                      textSize: 26,
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
                                          fontSize: 18,
                                          decoration:
                                              TextDecoration.lineThrough),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    TextWidget(
                                      text: '25%',
                                      textSize: 16,
                                    ),
                                    const SizedBox(width: 10),
                                    IconButton(
                                        onPressed: () {},
                                        icon: Icon(IconlyLight.heart))
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        OutlinedButton(
                                          onPressed: () {
                                            setState(() {
                                              if (i > 1) {
                                                i--;
                                              }
                                            });
                                          },
                                          child: Icon(
                                            Icons.remove,
                                            color: Colors.black,
                                          ),
                                          style: OutlinedButton.styleFrom(
                                            backgroundColor: Colors.white,
                                            shape: CircleBorder(),
                                            padding: EdgeInsets.all(10),
                                          ),
                                        ),
                                        TextWidget(
                                          text: ("${i} KG"),
                                          textSize: 22,
                                          isTitle: true,
                                        ),
                                        OutlinedButton(
                                          onPressed: () {
                                            setState(() {
                                              i++;
                                            });
                                          },
                                          child: Icon(
                                            Icons.add,
                                            color: Colors.black,
                                          ),
                                          style: OutlinedButton.styleFrom(
                                            backgroundColor: Colors.white,
                                            shape: CircleBorder(),
                                            padding: EdgeInsets.all(10),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 5),

                                TextWidget(
                                  text: 'Fruit is Favorate',
                                  textSize: 20,
                                  isTitle: true,
                                ),
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