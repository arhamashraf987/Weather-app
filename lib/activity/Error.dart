import 'package:flutter/material.dart';

class Errorr extends StatefulWidget {
  const Errorr({super.key});

  @override
  State<Errorr> createState() => _ErrorrState();
}

class _ErrorrState extends State<Errorr> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 250, left: 50),
            child: Column(
              children: [
                Icon(
                  Icons.signal_wifi_connected_no_internet_4_outlined,
                  size: 70,
                ),
                Column(
                  children: [
                    Text(
                      "*Data Not Found",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text("Try:", style: TextStyle(fontSize: 17, height: 5)),
                    Text(
                      "1. Check you Internet connection",
                      style: TextStyle(fontSize: 17),
                    ),
                    Text(
                      "2. Enter Correct Location              ",
                      style: TextStyle(fontSize: 17),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
