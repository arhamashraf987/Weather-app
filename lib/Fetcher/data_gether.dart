import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
class Elements {
  String? location;

  Elements(this.location) {
    location = this.location;
  }
  String? temp;
  String? wind_speed;
  String? condition;
  String? humidity;
  String? icon;
  String? day;
  Future<void> getdata(BuildContext context) async {
    try {
      Response weather_link = await get(Uri.parse(
          "http://api.weatherapi.com/v1/current.json?key=c24797660f344c009e3110157262705&q=$location&aqi=no"));
      Map weather_data = jsonDecode(weather_link.body);
      Map current_weather_data = weather_data["current"];
      // Getting current temperature
      double temperature = current_weather_data["temp_c"];
      print(temperature);
      // getting day
      int day_d = current_weather_data["is_day"];
      // Getting condition
      Map condition_data = current_weather_data["condition"];
      String condition_text = condition_data["text"];
      //Getting icon
      dynamic icon_data = condition_data["icon"];
      //Getting wind speed
      double wind_speed_data = current_weather_data["wind_kph"];
      // getting Humidity
      dynamic humid = current_weather_data["humidity"];
      //Assigning values
      temp = temperature.toString();
      wind_speed = wind_speed_data.toString();
      condition = condition_text.toString();
      humidity = humid.toString();
      icon = icon_data.toString();
      day = day_d.toString();

    } catch (e) {
      Navigator.pushReplacementNamed(context, "/Errorr");

    }
  }
}
