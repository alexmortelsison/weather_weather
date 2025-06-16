// services/weather_service.dart
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:location/location.dart';
import '../models/weather.dart';
import '../secrets.dart';

class WeatherService {
  final Location location = Location();

  Future<Weather> fetchWeather() async {
    bool serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        throw Exception('Location services are not enabled');
      }
    }

    PermissionStatus permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        throw Exception('Location permissions are denied');
      }
    }

    LocationData locationData = await location.getLocation();
    final lat = locationData.latitude;
    final lon = locationData.longitude;

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
