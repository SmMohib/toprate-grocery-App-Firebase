// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:iconly/iconly.dart';
import 'package:toprate/services/utils.dart';
import 'package:toprate/widget/item_widget.dart';
import 'package:toprate/widget/text_widget.dart';

class FeedsItemScreen extends StatefulWidget {
  static const routeName = "/FeeditemScreen";
  const FeedsItemScreen({super.key});

  @override
  State<FeedsItemScreen> createState() => _FeedsItemScreenState();
}

class _FeedsItemScreenState extends State<FeedsItemScreen> {
  @override
  Widget build(BuildContext context) {
    TextEditingController searchEditingController = TextEditingController();
    FocusNode searchfocusNode = FocusNode();
    Size size = Utils(context).sizeScreen;
    bool isEmpty = false;
    return Scaffold(
      appBar: AppBar(
        title: TextWidget(text: 'Products For Sale', textSize: 24),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: searchEditingController,
              onChanged: (value) {
                setState(() {});
              },
              decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide:
                          BorderSide(color: Color.fromARGB(223, 255, 10, 10))),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide:
                          BorderSide(color: Color.fromARGB(221, 255, 51, 0))),
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.amber,
                  ),
                  suffix: IconButton(
                    onPressed: () {
                      searchEditingController.clear();
                      searchfocusNode.unfocus();
                    },
                    icon: Icon(
                      Icons.close,
                      color:
                          searchfocusNode.hasFocus ? Colors.red : Colors.black,
                    ),
                  ),
                  hintText: 'Search '),
            ),
          ),
          isEmpty
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
        ],
      ),
    );
  }
}
