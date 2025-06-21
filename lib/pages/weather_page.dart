import 'package:flutter/material.dart';
import 'package:weather_weather/components/main_card.dart';
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
      appBar: AppBar(),
      body: FutureBuilder(
        future: weatherFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator.adaptive());
          } else if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          } else if (snapshot.hasData) {
            final weather = snapshot.data!;
            return Column(
              children: [
                MainCard(
                  cityName: weather.cityName,
                  weatherDescription: weather.description,
                  icon: weather.icon,
                  temperature: weather.temperature,
                ),
              ],
            );
          } else {
            return Center(
              child: Text("No data available."),
            );
          }
        },
      ),
    );
  }
}
