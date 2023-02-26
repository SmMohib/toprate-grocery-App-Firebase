// ignore_for_file: prefer_const_constructors

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:iconly/iconly.dart';
import 'package:provider/provider.dart';
import 'package:toprate/consts/colors.dart';
import 'package:toprate/provider/dark_theme_provider.dart';
import 'package:toprate/services/dark_theme_prefer.dart';
import 'package:toprate/services/utils.dart';
import 'package:toprate/widget/text_widget.dart';

class HomeScreen extends StatefulWidget {
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
      body: Column(
        children: [
          SizedBox(
            height: size.height * 0.33,
            child: Center(
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
                    onPressed: () {},
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
          SizedBox(
            height: size.width * 0.60,
            child: ListView.builder(
                itemCount: imagelist.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: themeState.getDarkTheme
                              ? Color.fromRGBO(198, 224, 252, 0.976)
                              : Color.fromARGB(66, 241, 212, 212),
                          borderRadius: BorderRadius.circular(14)),
                      height: size.height * 0.24,
                      // width: size.width * 22,
                      width: 200,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                  flex: 2,
                                  child: Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(12),
                                      child: Image.asset(
                                        '${imagelist[index]}',
                                        height: size.width * 0.25,
                                        //   width: size.width * 0.12,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  )),
                              Expanded(
                                  flex: 2,
                                  child: Column(
                                    children: [
                                      TextWidget(text: '1Kg', textSize: 24),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        // ignore: prefer_const_literals_to_create_immutables
                                        children: [
                                          Icon(
                                            IconlyBold.bag,
                                          ),
                                          Icon(
                                            IconlyBold.heart,
                                          ),
                                        ],
                                      ),
                                    ],
                                  )),
                            ],
                          ),
                          Row(
                            children: [
                              TextWidget(
                                text: '10\$',
                                textSize: 27,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              TextWidget(text: 'text', textSize: 24),
                            ],
                          ),
                          TextWidget(text: 'Pudina Pata', textSize: 24),
                        ],
                      ),
                    ),
                  );
                }),
          )
          //   Image.asset(
          //     'images/warning-sign.png',
          //     height: 200,
          //     width: 200,
          //   ),
          //  Image.network(
          //               "https://cdn.britannica.com/39/187439-050-35BA4DCA/Broccoli-florets.jpg"),
        ],
      ),
    );
  }
}
