import 'package:flutter/material.dart';
import 'package:weather/activity/Error.dart';
import 'package:weather/activity/Home.dart';
import 'package:weather/activity/Loading.dart';


void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    routes: {
      "/": (context)=>loading(),
      "/home": (context)=>home(),
      "/loading": (context)=>loading(),
      "/Errorr": (context)=>Errorr(),
    },
  ));
}