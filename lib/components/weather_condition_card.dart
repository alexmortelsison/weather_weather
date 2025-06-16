import 'package:flutter/material.dart';

class WeatherConditionCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final String weatherDescription;
  const WeatherConditionCard({
    super.key,
    required this.title,
    required this.icon,
    required this.weatherDescription,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon),
        Text(title),
        Text(weatherDescription),
      ],
    );
  }
}
