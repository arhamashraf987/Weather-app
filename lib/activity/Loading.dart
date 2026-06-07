import 'package:flutter/material.dart';
import 'package:weather/Fetcher/data_gether.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class loading extends StatefulWidget {
  const loading({super.key});

  @override
  State<loading> createState() => _loadingState();
}

class _loadingState extends State<loading> {
  String? temp;
  String? wind_speed;
  String? humidity;
  String? condition;
  String? icon;
  String? city;
  String? day;
  void StartApp () async {
    final search = ModalRoute.of(context)?.settings.arguments as Map? ??{};
    city = search["search"]?? "Shorkot";
    Elements instance = Elements("$city");
    await instance.getdata(context);
    temp = instance.temp;
    wind_speed = instance.wind_speed;
    humidity = instance.humidity;
    condition = instance.condition;
    icon = instance.icon;
    day = instance.day;
    Future.delayed(Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, "/home", arguments: {
        "temp" : temp,
        "wind_speed" : wind_speed,
        "humidity" : humidity,
        "condition" : condition,
        "icon" : icon,
        "city" : city,
        "day" : day
      }
      );
    });




  }

  @override
  void initState() {
    super.initState();
  }
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    StartApp();  // Call after build is ready
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 150),
              child: CircleAvatar(backgroundImage: AssetImage("Images/logo.jpeg"), radius: 70,),
            ),
            SizedBox(height: 35,),
            Text("Weather App", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
            SizedBox(height: 50,),
            LoadingAnimationWidget.inkDrop(color: Colors.black, size: 32),
            SizedBox(height: 100,),
            Padding(
              padding: const EdgeInsets.only(top: 50),
              child: Text("Created by ARHAM ASHRAF", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15, fontStyle: FontStyle.italic, color: Colors.red), ),
            ),
          ],
        ),
      ),

    );
  }
}
