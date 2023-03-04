import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:toprate/consts/colors.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  int i = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: btColor,
      body: Column(
        children: [
          Text('${(10 * i)}'),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              OutlinedButton(
                onPressed: () {
                  setState(() {
                    if (i > 1) {
                      i--;
                    }
                  });
                },
                child: Icon(
                  Icons.remove,
                  color: Colors.black,
                ),
                style: OutlinedButton.styleFrom(
                  backgroundColor: Colors.white,
                  shape: CircleBorder(),
                  padding: EdgeInsets.all(10),
                ),
              ),
              SizedBox(
                width: 30,
              ),
              Text(
                '$i kg',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                width: 30,
              ),
              OutlinedButton(
                onPressed: () {
                  setState(() {
                    i++;
                  });
                },
                child: Icon(
                  Icons.add,
                  color: Colors.black,
                ),
                style: OutlinedButton.styleFrom(
                  backgroundColor: Colors.white,
                  shape: CircleBorder(),
                  padding: EdgeInsets.all(10),
                ),
              ),
            ],
          ),
          Text(
            'Chackout: (${(10 * i)})',
            style: TextStyle(fontSize: 20),
          ),
        ],
      ),
    );
  }
}
