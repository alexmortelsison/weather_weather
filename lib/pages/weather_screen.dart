import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:weather_weather/components/additional_info_card.dart';
import 'package:weather_weather/components/hourly_card.dart';
import 'package:weather_weather/components/main_card.dart';

class WeatherScreen extends StatelessWidget {
  const WeatherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Weather Weather",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.refresh),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: double.infinity,
              child: MainCard(),
            ),
            SizedBox(height: 20),
            Text(
              "Weather Forecast",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 2),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  HourlyCard(
                    icon: Icons.cloud,
                    temperature: '24°C',
                    time: '03:00',
                  ),
                  HourlyCard(
                    icon: Icons.sunny,
                    temperature: '29°C',
                    time: '03:00',
                  ),
                  HourlyCard(
                    icon: Icons.air,
                    temperature: '22°C',
                    time: '03:00',
                  ),
                  HourlyCard(
                    icon: Icons.cloud,
                    temperature: '24°C',
                    time: '03:00',
                  ),
                  HourlyCard(
                    icon: Icons.cloud,
                    temperature: '24°C',
                    time: '03:00',
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Text(
              "Additional Information",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 2),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                AdditionalInfoCard(
                  icon: Icons.water_drop,
                  text: "Humidity",
                  result: "94",
                ),
                AdditionalInfoCard(
                  icon: Icons.air,
                  text: "Wind Speed",
                  result: "7.67",
                ),
                AdditionalInfoCard(
                  icon: Icons.beach_access,
                  text: "Pressure",
                  result: "1006",
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
