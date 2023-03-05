import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toprate/consts/theme_data.dart';
import 'package:toprate/inner_screens/feeds_screen.dart';
import 'package:toprate/inner_screens/productdetail.dart';

import 'package:toprate/provider/dark_theme_provider.dart';
import 'package:toprate/screens/btm_nav.dart';
import 'package:toprate/inner_screens/onsale_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  DarkThemeProvider themeChangeProvider = DarkThemeProvider();

  void getCurrentAppTheme() async {
    themeChangeProvider.setDarkTheme =
        await themeChangeProvider.darkThemePrefer.getTheme();
  }

  @override
  void initState() {
    getCurrentAppTheme();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) {
          return themeChangeProvider;
        })
      ],
      child: Consumer<DarkThemeProvider>(
        builder: (context, themeProvider, child) {
          return MaterialApp(
            title: 'Flutter Demo',
            theme:
                Style.themeData(themeProvider.getDarkTheme, context, context),
            // ignore: prefer_const_constructors
            home: BtmNev(),
            debugShowCheckedModeBanner: false,
            routes: {
              ProductDetail.routeName:(context) => const ProductDetail(),
              FeedsItemScreen.routeName: (context) => const FeedsItemScreen(),
              OnSaleScreen.routeName: (context) => const OnSaleScreen(),
            },
          );
        },
      ),
    );
  }
}
