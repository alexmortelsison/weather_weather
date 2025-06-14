import 'package:flutter/material.dart';

class MainCard extends StatelessWidget {
  final String temperature;
  final String weatherCondition;
  const MainCard({
    super.key,
    required this.temperature,
    required this.weatherCondition,
  });

  @override
  Widget build(BuildContext context) {
    String temp = double.parse(temperature).round().toString();
    return Card(
      elevation: 5,
      shadowColor: Colors.blue.shade900,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              "$temp°C",
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Icon(Icons.cloud, size: 64),
            SizedBox(height: 16),
            Text(
              weatherCondition,
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
