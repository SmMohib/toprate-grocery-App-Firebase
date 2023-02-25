import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:iconly/iconly.dart';
import 'package:provider/provider.dart';
import 'package:toprate/consts/colors.dart';
import 'package:toprate/consts/text_style.dart';
import 'package:toprate/provider/dark_theme_provider.dart';
import 'package:toprate/screens/card.dart';
import 'package:toprate/widget/text_widget.dart';
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
                        const Text(
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
            const Divider(
              thickness: 0,
              color: dark,
            ),
            listile(
                title: 'Address',
                subtitle: 'My sddress Mirpur1,Dhaka',
                icon: IconlyBold.location,
                onTap: () async {
                  await _showAddressDialog();
                }),
            listile(
                title: 'Others',
                // subtitle: 'My sddress Mirpur1,Dhaka',
                icon: IconlyBold.bag,
                onTap: () async {}),
            listile(title: 'My Orders', icon: IconlyLight.bag, onTap: () {}),
            listile(title: 'Wishist', icon: IconlyBold.heart, onTap: () {}),
            listile(
                title: 'Forget Password',
                icon: IconlyBold.unlock,
                onTap: () {
                  _showLoginDilog();
                }),
            listile(
                title: 'Login',
                icon: IconlyBold.login,
                onTap: () {
                  _showLoginDilog();
                }),
            SwitchListTile(
              title: Text(
                themeState.getDarkTheme ? 'Light' : 'Dart',
                style:
                    const TextStyle(fontSize: 17, fontWeight: FontWeight.w700),
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

  Future<void> _showLoginDilog() async {
    await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Row(
              children: [
                Image.asset(
                  'images/warning-sign.png',
                  height: 25,
                  width: 25,
                ),
                SizedBox(
                  width: 7,
                ),
                Text('You Are Logout App?'),
              ],
            ),
            actions: [
              TextButton(
                  onPressed: () {},
                  child: Text(
                    'Cancel',
                    style: text20(),
                  )),
              TextButton(
                  onPressed: () {},
                  child: Text(
                    'Logout',
                    style: text20(),
                  ))
            ],
          );
        });
  }

  Future<void> _showAddressDialog() async {
    await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Update'),
            content: const TextField(
              maxLines: 5,
              decoration: InputDecoration(hintText: 'Your Address'),
            ),
            actions: [
              TextButton(
                onPressed: () {},
                child: const Text('Cancel'),
              ),
              TextButton(
                onPressed: () {},
                child: const Text('Update'),
              ),
            ],
          );
        });
  }
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
      style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w700),
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
