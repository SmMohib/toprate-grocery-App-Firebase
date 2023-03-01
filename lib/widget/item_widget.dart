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
                ? Color.fromRGBO(198, 224, 252, 0.976)
                : Color.fromARGB(66, 241, 212, 212),
            borderRadius: BorderRadius.circular(14)),

        // width: size.width * 22,
        //  width: size.height * 0.27,
        // height: size.width * 0.26,

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      '${imagelist.first}',
                      height: size.height * 0.26,
                      width: size.width * 0.22,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    TextWidget(text: '1KG', textSize: 29),
                    SizedBox(
                      height: size.height / 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            IconlyLight.bag,
                          ),
                        ),
                        SizedBox(
                          width: 3,
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            IconlyLight.heart,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 3),
              child: Row(
                children: [
                  TextWidget(
                    text: 'Price: 10\$',
                    textSize: 27,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    '13\$ ',
                    style: TextStyle(
                        fontSize: 20, decoration: TextDecoration.lineThrough),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8),
              child: TextWidget(
                text: 'Pudina Pata',
                textSize: 27,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
