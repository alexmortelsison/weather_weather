import 'package:flutter/material.dart';

class HourlyCard extends StatelessWidget {
  final String time;
  final IconData icon;
  final String weatherDescription;
  const HourlyCard({
    super.key,
    required this.time,
    required this.icon,
    required this.weatherDescription,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      child: Column(
        children: [
          Text(time),
          SizedBox(height: 4),
          Icon(icon),
          SizedBox(height: 6),
          Text(weatherDescription),
        ],
      ),
    );
  }
}
