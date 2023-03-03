import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:toprate/services/utils.dart';
import 'package:toprate/widget/feed_items.dart';
import 'package:toprate/widget/item_widget.dart';
import 'package:toprate/widget/text_widget.dart';

class OnSaleScreen extends StatelessWidget {
  static const routeName = "/OnsaleScreen";
  const OnSaleScreen({super.key});

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
          : GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              children: List.generate(5, (index) {
                return ItemWidget();
              }),
            ),
    );
  }
}
