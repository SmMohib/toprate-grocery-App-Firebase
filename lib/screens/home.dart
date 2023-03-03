// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:iconly/iconly.dart';
import 'package:provider/provider.dart';
import 'package:toprate/inner_screens/feeds_screen.dart';
import 'package:toprate/provider/dark_theme_provider.dart';
import 'package:toprate/inner_screens/onsale_screen.dart';
import 'package:toprate/services/utils.dart';
import 'package:toprate/widget/feed_items.dart';
import 'package:toprate/widget/item_widget.dart';
import 'package:toprate/widget/text_widget.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = "/OnsaleScreen";
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> imagelist = [
    'images/offres/Offer1.jpg',
    'images/offres/Offer2.jpg',
    'images/offres/Offer3.jpg',
    'images/offres/Offer4.jpg',
    'images/offres/Offer2.jpg',
  ];
  @override
  Widget build(BuildContext context) {
    final themeState = Provider.of<DarkThemeProvider>(context);
    Size size = Utils(context).sizeScreen;
    return Scaffold(
        body: SingleChildScrollView(
            child: Column(children: [
      //slider
      SizedBox(
        height: size.height * 0.27,
        child: Swiper(
          itemCount: imagelist.length,
          itemBuilder: (context, index) {
            return Image.asset(
              imagelist[index],
              fit: BoxFit.cover,
            );
          },
          autoplay: true,
          pagination: SwiperPagination(
              alignment: Alignment.bottomCenter,
              builder: DotSwiperPaginationBuilder(
                color: Colors.white,
                activeColor: Colors.red,
              )),
          control: SwiperControl(color: Colors.black),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // ignore: prefer_const_constructors
            Text(
              'Resent Added',
              style: TextStyle(fontSize: 20),
            ),
            TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, OnSaleScreen.routeName);
                },
                child: Text(
                  'See All',
                  style: TextStyle(
                      fontSize: 20,
                      color: themeState.getDarkTheme
                          ? Colors.black
                          : Colors.white),
                ))
          ],
        ),
      ),

      //recent add
      Row(
        children: [
          RotatedBox(
            quarterTurns: -1,
            child: Row(
              children: [
                TextWidget(
                  text: 'ON SALE',
                  textSize: 30,
                  color: Colors.red,
                ),
                SizedBox(
                  width: 5,
                ),
                Icon(
                  IconlyLight.discount,
                  color: Colors.red,
                )
              ],
            ),
          ),
          //item
          Flexible(
            child: SizedBox(
              height: size.height * 0.26,
              child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  itemCount: imagelist.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return ItemWidget();
                  }),
            ),
          ),
        ],
      ),
      InkWell(
          onTap: () {
            Navigator.pushNamed(context, FeedsItemScreen.routeName);
          },
          child: TextWidget(
            text: 'View All',
            textSize: 24,
            fontWeight: FontWeight.w700,
            isTitle: true,
          )),
      SizedBox(
        height: 4,
      ),
      GridView.count(
        crossAxisCount: 2,
        shrinkWrap: true,
        children: List.generate(5, (index) {
          return Feed_Items();
        }),
      ),
    ])));
  }
}
