import 'package:flutter/material.dart';
import 'package:weather_icons/weather_icons.dart';
import 'package:weather_weather/components/main_card.dart';
import 'package:weather_weather/components/weather_condition_card.dart';
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
      body: FutureBuilder<Weather>(
        future: weatherFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          } else if (snapshot.hasData) {
            final weather = snapshot.data!;
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MainCard(
                    cityName: weather.cityName,
                    weatherDescription: weather.description,
                    icon: WeatherIcons.cloudy,
                    temperature: weather.temperature,
                  ),
                  const SizedBox(height: 64),
                  const Text("Hourly Forecast", style: TextStyle(fontSize: 20)),

                  const SizedBox(height: 64),

                  const Text(
                    "Weather Condition",
                    style: TextStyle(fontSize: 20),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      WeatherConditionCard(
                        title: "Humidity",
                        icon: Icons.water_drop,
                        weatherDescription: "${weather.humidity}%",
                      ),
                      WeatherConditionCard(
                        title: "Wind Speed",
                        icon: WeatherIcons.windy,
                        weatherDescription: "${weather.windSpeed} m/s",
                      ),
                      WeatherConditionCard(
                        title: "Pressure",
                        icon: WeatherIcons.umbrella,
                        weatherDescription: "${weather.pressure} hPa",
                      ),
                    ],
                  ),
                ],
              ),
            );
          } else {
            return const Center(child: Text("No data available"));
          }
        },
      ),
    );
  }
}
