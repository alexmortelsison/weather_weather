import 'dart:convert';

import 'package:geolocator/geolocator.dart';
import 'package:weather_weather/models/weather.dart';
import 'package:http/http.dart' as http;
import 'package:weather_weather/secrets.dart';

class WeatherService {
  Future<Weather> fetchWeather() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      throw Exception("Location services are disabled.");
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }
    if (permission == LocationPermission.denied) {
      throw Exception("Location permissions are denied.");
    }

    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    final lat = position.latitude;
    final lon = position.longitude;
    final url = Uri.parse(
      "https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=$APIKEY&units=metric",
    );
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);
      return Weather.fromJson(data);
    } else {
      throw Exception("Failed to fetch weather data");
    }
  }
}
