import 'package:flutter/widgets.dart';
import 'package:lottie/lottie.dart';

class Weather {
  final String cityName;
  final String weatherDescription;
  final int temperature;
  final int pressure;
  final int humidity;
  final double windSpeed;

  Weather({
    required this.cityName,
    required this.weatherDescription,
    required this.temperature,
    required this.pressure,
    required this.humidity,
    required this.windSpeed,
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      cityName: json["name"],
      weatherDescription: json["weather"][0]["description"],
      temperature: (json["main"]["temp"] as num).round(),
      pressure: json["main"]["pressure"],
      humidity: json["main"]["humidity"],
      windSpeed: (json["wind"]["speed"] as num).toDouble(),
    );
  }

  String get conditionKeyword {
    final desc = weatherDescription.toLowerCase();
    if (desc.contains("cloud")) return "cloudy";
    if (desc.contains("rain")) return "rainy";
    if (desc.contains("storm") || desc.contains("thunder")) return "stormy";
    return "default";
  }

  String get weatherIconPath {
    switch (conditionKeyword) {
      case "cloudy":
        return "assets/cloudy.json";
      case "rainy":
        return "assets/rainy.json";
      case "stormy":
        return "assets/thunderstorm.json";
      default:
        return "assets/sunny.json";
    }
  }
}
