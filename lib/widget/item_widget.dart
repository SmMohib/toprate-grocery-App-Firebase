import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:iconly/iconly.dart';
import 'package:provider/provider.dart';
import 'package:toprate/provider/dark_theme_provider.dart';
import 'package:toprate/services/utils.dart';
import 'package:toprate/widget/text_widget.dart';

class ItemWidget extends StatelessWidget {
  ItemWidget({super.key});
  final List<String> imagelist = [
    'images/cat/fruits.png',
    'images/offres/Offer2.jpg',
    'images/offres/Offer3.jpg',
    'images/offres/Offer4.jpg',
    'images/offres/Offer2.jpg',
  ];
  @override
  Widget build(BuildContext context) {
    final themeState = Provider.of<DarkThemeProvider>(context);
    Size size = Utils(context).sizeScreen;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
          decoration: BoxDecoration(
              color: themeState.getDarkTheme
                  ? Color.fromRGBO(226, 236, 247, 0.973)
                  : Color.fromARGB(66, 241, 212, 212),
              borderRadius: BorderRadius.circular(14)),

          // width: size.width * 22,
          //  width: size.height * 0.27,
          // height: size.width * 0.26,

          child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                // mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        'images/cat/Spinach.png',
                        height: size.width * 0.22,
                        width: size.width * 0.22,
                        fit: BoxFit.fill,
                      ),
                      Column(
                        children: [
                          TextWidget(
                            text: '1KG',
                            textSize: 22,
                            isTitle: true,
                          ),
                          const SizedBox(
                            height: 6,
                          ),
                          Row(
                            children: [
                              IconButton(
                                  onPressed: () {},
                                  icon: Icon(IconlyLight.bag)),
                              IconButton(
                                  onPressed: () {},
                                  icon: Icon(IconlyLight.heart))
                            ],
                          ),
                        ],
                      )
                    ],
                  ),

                  const SizedBox(height: 5),
                  Row(
                    children: [
                      TextWidget(
                        text: '200',
                        textSize: 26,
                        color: Colors.green,
                        isTitle: true,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "100",
                        style: TextStyle(
                            fontSize: 18,
                            decoration: TextDecoration.lineThrough),
                      )
                    ],
                  ),
                  const SizedBox(height: 5),
                  TextWidget(
                    text: 'Fruit',
                    textSize: 20,
                    isTitle: true,
                  ),
                  const SizedBox(height: 5),

                  //   Image.asset(
                  //     'images/warning-sign.png',
                  //     height: 200,
                  //     width: 200,
                  //   ),
                  //  Image.network(
                  //               "https://cdn.britannica.com/39/187439-050-35BA4DCA/Broccoli-florets.jpg"),
                ],
              ))),
    );
  }
}
