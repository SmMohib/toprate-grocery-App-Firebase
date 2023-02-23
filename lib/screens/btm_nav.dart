// ignore_for_file: prefer_const_constructors
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:provider/provider.dart';
import 'package:toprate/consts/colors.dart';
import 'package:toprate/provider/dark_theme_provider.dart';
import 'package:toprate/screens/card.dart';
import 'package:toprate/screens/categories.dart';
import 'package:toprate/screens/home.dart';
import 'package:toprate/screens/users.dart';

class BtmNev extends StatefulWidget {
  const BtmNev({super.key});

  @override
  State<BtmNev> createState() => _BtmNevState();
}

class _BtmNevState extends State<BtmNev> {
  int _selectedIndex = 0;
  // final List<Map<String, dynamic>> _pages = [
  //   // {'page': HomeScreen(), 'title': 'Home Page'},
  //   // {'page': CategoriesScreen(), 'title': 'Categories'},
  //   // {'page': CardScreen(), 'title': 'Card'},
  //   // {'page': UsersScreen(), 'title': 'User Profile'},
  // ];

  final _pages = [
    HomeScreen(),
    CategoriesScreen(),
    CardScreen(),
    UsersScreen()
  ];

  void _selectedPage(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final themeState = Provider.of<DarkThemeProvider>(context);
    bool _isdark = themeState.getDarkTheme;
    return SafeArea(
      child: Scaffold(
        //appBar: AppBar(
        //   title: Text(_pages[_selectedIndex]['title']),
        // ),
        //body: _pages[_selectedIndex]['page'],
        body: _pages[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
            backgroundColor:
                themeState.getDarkTheme ? Theme.of(context).cardColor : dark,
            showSelectedLabels: false,
            type: BottomNavigationBarType.fixed,
            showUnselectedLabels: false,
            currentIndex: _selectedIndex,
            unselectedItemColor: _isdark ? dark : btColor,
            selectedItemColor: _isdark ? primary : secondary,
            onTap: _selectedPage,
            // ignore: prefer_const_literals_to_create_immutables
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                  icon: Icon(
                      _selectedIndex == 0 ? IconlyBold.home : IconlyLight.home),
                  label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(_selectedIndex == 1
                      ? IconlyBold.category
                      : IconlyLight.category),
                  label: 'Categories'),
              BottomNavigationBarItem(
                  icon: Icon(
                      _selectedIndex == 2 ? IconlyBold.buy : IconlyLight.buy),
                  label: 'Card'),
              BottomNavigationBarItem(
                  icon: Icon(_selectedIndex == 3
                      ? IconlyBold.user_2
                      : IconlyLight.user),
                  label: 'Users'),
            ]),
      ),
    );
  }
}
