import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:toprate/consts/colors.dart';
import 'package:toprate/widget/auth_button.dart';

class CardScreen extends StatelessWidget {
  const CardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: 20,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(5.0),
            child: Container(
              height: 100,
              width: double.infinity,
              color: btColor,
            ),
          );
        },
      ),
      bottomNavigationBar: Container(
          color: Colors.purple,
          height: 60,
          width: double.infinity,
          child: AuthButton(fct: () {}, buttonText: 'Order'),),
    );
  }
}
