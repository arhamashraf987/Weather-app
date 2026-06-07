import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'package:flutter/material.dart';
import 'package:weather_icons/weather_icons.dart';

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  TextEditingController search = new TextEditingController();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final all_data = ModalRoute.of(context)?.settings.arguments as Map? ?? {};
    String temp = (all_data["temp"].toString());
    String hum = (all_data["humidity"].toString());
    String icon = (all_data["icon"].toString());
    String cond = (all_data["condition"].toString());
    String wind_speed = ((all_data['wind_speed']).toString());
    String city = all_data["city"].toString();
    String day = all_data["day"].toString();
    bool isday = day == "1";
    Color textc = isday? Colors.black : Colors.white;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        padding: EdgeInsets.only(bottom: 100),
        decoration: BoxDecoration(

          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              stops: [0.3, 0.7],
              colors:
                  isday
              ?[Colors.blue, Colors.lightBlueAccent]
              : [Colors.black, Colors.black]
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                //Search coulmn container
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 40, left: 17, right: 17),
                      padding: EdgeInsets.only(left: 12),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(45),
                        border: Border.all(color: Colors.black),
                      ),
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, "/loading", arguments: {
                                "search" : search.text,
                              });
                            },
                            child: Icon(Icons.search),
                          ),
                          Expanded(
                            child: TextField(
                              controller: search,
                              decoration: InputDecoration(
                                hintText: "Enter your city name here",
                                border: InputBorder.none,
                              ),
                              textInputAction: TextInputAction.search,
                              onSubmitted: (value) {
                                Navigator.pushNamed(context, "/loading", arguments: {
                                  "search" : value
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white.withOpacity(0.5),
                      ),
                      margin: EdgeInsets.only(top: 10, left: 15, right: 15),
                      padding: EdgeInsets.only(bottom: 0),
                      child: Row (
                        children: [
                          Image.network("https:$icon"),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [Text("$cond", style: TextStyle(color: textc),), Text("In $city", style: TextStyle(color: textc),)],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white.withOpacity(0.5),
                      ),
                      margin: EdgeInsets.symmetric(
                          horizontal: 15,
                          vertical: 10
                      ),
                      padding: EdgeInsets.only(bottom: 75),
                      child: Container(
                        margin: EdgeInsets.only(top: 13),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [Icon(WeatherIcons.thermometer, color: textc,),
                              Container(
                                margin: EdgeInsets.only(top: 25, ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("$temp", style: TextStyle(fontSize: 90, color: textc),
                                    ),
                                    Text("Celcius", style: TextStyle(color: textc),)
                                  ],
                                ),
                              )]),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white.withOpacity(0.5),
                      ),
                      margin: EdgeInsets.only(left: 15, right: 15),
                      padding: EdgeInsets.only(bottom: 35),
                      child:
                      Container(
                        margin: EdgeInsets.only(top: 7, left: 3),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(WeatherIcons.humidity, color: textc,),
                            Container(
                              margin: EdgeInsets.only(top: 15, left: 36),
                              child: Column(
                                children: [
                                  Text("$hum", style: TextStyle(fontSize: 50, color: textc),),
                                  Text("Percentage", style: TextStyle(color: textc),)
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white.withOpacity(0.5),
                      ),
                      margin: EdgeInsets.only(left: 10, right: 15),
                      padding: EdgeInsets.only(bottom: 35),
                      child: Container(
                        margin: EdgeInsets.only(left: 5, top: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(WeatherIcons.day_windy, color: textc,),
                            Container(
                              margin: EdgeInsets.only(top: 15, left: 20),
                              child: Column(
                                children: [
                                  Text("$wind_speed", style: TextStyle(fontSize: 50, color: textc)),
                                  Text("Km/h", style: TextStyle(color: textc),)
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                child: Column(
                  children: [
                    Text(
                      "Data obtained from weather api.org",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: textc,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 15),
                      child: Text(
                        "Created by Arham Ashraf",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: textc,
                          fontSize: 15,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
