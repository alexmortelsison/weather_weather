import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:weather_icons/weather_icons.dart';

class Weather {
  final String cityName;
  final String description;
  final int temperature;
  final int humidity;
  final int pressure;
  final double windSpeed;

  Weather({
    required this.cityName,
    required this.description,
    required this.temperature,
    required this.humidity,
    required this.pressure,
    required this.windSpeed,
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      cityName: json["name"],
      description: json["weather"][0]["description"],
      temperature: (json["main"]["temp"] as num).round(),
      humidity: json["main"]["humidity"],
      pressure: json["main"]["pressure"],
      windSpeed: (json["wind"]["speed"] as num).toDouble(),
    );
  }

  String get conditionKeyword {
    final desc = description.toLowerCase();
    if (desc.contains("cloud")) return "cloudy";
    if (desc.contains("rain")) return "rainy";
    if (desc.contains("snow")) return "snowy";
    if (desc.contains("storm") || desc.contains("thunder")) return "stormy";
    if (desc.contains("clear")) return "clear";
    return "default";
  }

  IconData get icon {
    switch (conditionKeyword) {
      case "cloudy":
        return Icons.wb_cloudy_outlined;
      case "rainy":
        return WeatherIcons.rain_wind;
      case "snowy":
        return WeatherIcons.snow;
      case "stormy":
        return WeatherIcons.day_storm_showers;
      case "clear":
        return WeatherIcons.day_cloudy_windy;
      default:
        return Icons.wb_sunny;
    }
  }
}
