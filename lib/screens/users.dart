// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:iconly/iconly.dart';
import 'package:provider/provider.dart';
import 'package:toprate/consts/colors.dart';
import 'package:toprate/consts/text_style.dart';
import 'package:toprate/provider/dark_theme_provider.dart';
import 'package:toprate/screens/card.dart';
import 'package:toprate/widget.dart/text_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';

class UsersScreen extends StatefulWidget {
  const UsersScreen({super.key});

  @override
  State<UsersScreen> createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {
  @override
  Widget build(BuildContext context) {
    final themeState = Provider.of<DarkThemeProvider>(context);

    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        Text(
                          'Hi, Mohib',
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.w700),
                        ),
                        TextWidget(text: 'bazarbd@gmail.com', textSize: 20),
                      ],
                    ),
                    // Padding(
                    //   padding: const EdgeInsets.all(5.0),
                    //   child: CachedNetworkImage(
                    //     imageUrl:
                    //         'https://st3.depositphotos.com/11585370/19184/i/600/depositphotos_191843146-stock-photo-skeptical-and-dissatisfied-young-brural.jpg',
                    //     // "https://www.pngkey.com/png/detail/771-7712282_house-cleaning-cleaning-girl-png.png",
                    //     height: 100,
                    //     width: 100,
                    //     fit: BoxFit.cover,
                    //     progressIndicatorBuilder:
                    //         (context, url, downloadProgress) =>
                    //             CircularProgressIndicator(
                    //                 value: downloadProgress.progress),
                    //     errorWidget: (context, url, error) => Icon(Icons.error),
                    //   ),
                    // ),
                  ],
                )),
            Divider(
              thickness: 0,
              color: dark,
            ),
            listile(
                title: 'Address',
                subtitle: 'My sddress Mirpur1,Dhaka',
                icon: IconlyBold.location,
                onTap: () async {
                  await showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text('Update'),
                          content: TextField(
                            maxLines: 5,
                            decoration:
                                InputDecoration(hintText: 'Your Address'),
                          ),
                        );
                      });
                }),
            listile(
                title: 'Others',
                // subtitle: 'My sddress Mirpur1,Dhaka',
                icon: IconlyBold.bag,
                onTap: () async {
                  await _showAddressDialog();
                  // await showDialog(
                  //     context: context,
                  //     builder: (context) {
                  //       return AlertDialog(
                  //         title: Text('Update'),
                  //         content: TextField(
                  //           maxLines: 5,
                  //           decoration:
                  //               InputDecoration(hintText: 'Your Address'),
                  //         ),
                  //       );
                  //     });
                }),
            listile(title: 'My Orders', icon: IconlyLight.bag, onTap: () {}),
            listile(title: 'Wishist', icon: IconlyBold.heart, onTap: () {}),
            listile(
                title: 'Forget Password',
                icon: IconlyBold.unlock,
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => CardScreen()));
                }),
            listile(title: 'Login', icon: IconlyBold.login, onTap: () {}),
            SwitchListTile(
              title: Text(
                themeState.getDarkTheme ? 'Light' : 'Dart',
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.w700),
              ),
              secondary: Icon(themeState.getDarkTheme
                  ? Icons.dark_mode_outlined
                  : Icons.light_mode_outlined),
              onChanged: (bool value) {
                setState(() {
                  themeState.setDarkTheme = value;
                });
              },
              value: themeState.getDarkTheme,
            ),
           
          ],
        ),
      ),
    );
  }

  Future<void> _showAddressDialog() async {
    await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Update'),
            content: TextField(
              // onChanged: (value) {
              //   print('_addressTextController.text ${_addressTextController.text}');
              // },
              //  controller: _addressTextController,
              maxLines: 5,
              decoration: const InputDecoration(hintText: "Your address"),
            ),
            actions: [
              TextButton(
                onPressed: () async {
                  // String _uid = user!.uid;
                  // try {
                  //   await FirebaseFirestore.instance
                  //       .collection('users')
                  //       .doc(_uid)
                  //       .update({
                  //     'shipping-address': _addressTextController.text,
                  //   });

                  Navigator.pop(context);
                  //   setState(() {
                  //     address = _addressTextController.text;
                  //   });
                  // } catch (err) {
                  //   GlobalMethods.errorDialog(
                  //       subtitle: err.toString(), context: context);
                  // }
                },
                child: const Text('Update'),
              ),
            ],
          );
        });
  }

  Widget listile({
    required String title,
    String? subtitle,
    required IconData icon,
    VoidCallback? onTap,
  }) {
    return ListTile(
      title: Text(
        title,
        style: TextStyle(fontSize: 17, fontWeight: FontWeight.w700),
      ),
      subtitle: Text(
        subtitle == null ? "" : subtitle,
        style: text16(),
      ),
      leading: Icon(icon),
      trailing: const Icon(IconlyLight.arrow_right_2),
      onTap: onTap,
    );
  }
}
