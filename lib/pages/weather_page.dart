import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_weather/models/weather.dart';
import 'package:weather_weather/services/weather_service.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  late Future<Weather> weatherFuture;
  final weatherService = WeatherService();

  @override
  void initState() {
    super.initState();
    weatherFuture = weatherService.fetchWeather();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          "Weather-Weather",
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: weatherFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator.adaptive(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text("Error: ${snapshot.error}"),
            );
          } else if (snapshot.hasData) {
            final weather = snapshot.data;
            return SizedBox(
              height: double.infinity,
              child: Center(
                child: Column(
                  children: [
                    SizedBox(height: 64),
                    Text(
                      weather!.cityName,
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "${weather.temperature}°C",
                      style: TextStyle(fontSize: 28),
                    ),
                    Lottie.asset(weather.weatherIconPath),
                    Text(
                      weather.weatherDescription.toUpperCase(),
                      style: TextStyle(fontSize: 24),
                    ),
                  ],
                ),
              ),
            );
          } else {
            return Text("No data available");
          }
        },
      ),
    );
  }
}
